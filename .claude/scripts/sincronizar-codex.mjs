#!/usr/bin/env node
// sincronizar-codex.mjs — genera los artefactos de Codex a partir de .claude/ (fuente única).
//
//   node .claude/scripts/sincronizar-codex.mjs              regenera AGENTS.md, .agents/skills/ y .codex/agents/
//   node .claude/scripts/sincronizar-codex.mjs --verificar  no escribe nada; sale con código 1 si algo está
//                                                           desactualizado, si hay enlaces rotos o un TOML inválido
//
// Sin dependencias, multiplataforma (Windows/macOS/Linux). Salida determinista y con finales de línea LF.
//
// Qué genera:
//   CLAUDE.md                    → AGENTS.md              (instrucciones del proyecto para Codex)
//   .claude/commands/<c>.md      → .agents/skills/<c>/SKILL.md   (Codex no tiene comandos de proyecto: son skills)
//   .claude/skills/<s>/**        → .agents/skills/<s>/**
//   .claude/agents/<a>.md        → .codex/agents/<a>.toml (agentes personalizados de Codex)
//
// No edites lo generado: edita .claude/ o CLAUDE.md y vuelve a correr este script.

import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const RAIZ = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..', '..');
const MARCA = 'Generado por sincronizar-codex — no editar; edita .claude/';
const LIMITE_AGENTS_MD = 30 * 1024; // Codex lee hasta 32 KiB por defecto (project_doc_max_bytes)
const LIMITE_DESCRIPCION = 1024;

const posix = path.posix;
const errores = [];
const avisos = [];

// ---------------------------------------------------------------- utilidades de archivo

const rel = (abs) => path.relative(RAIZ, abs).split(path.sep).join('/');
const abs = (r) => path.join(RAIZ, ...r.split('/'));
const existe = (r) => fs.existsSync(abs(r));
const leer = (r) => fs.readFileSync(abs(r), 'utf8').replace(/^\uFEFF/, '').replace(/\r\n?/g, '\n');
const ordenar = (xs) => [...xs].sort((a, b) => (a < b ? -1 : a > b ? 1 : 0));

function listar(dirRel, filtro = () => true) {
  if (!existe(dirRel)) return [];
  return ordenar(fs.readdirSync(abs(dirRel), { withFileTypes: true }).filter(filtro).map((d) => d.name));
}

function listarRecursivo(dirRel) {
  const salida = [];
  for (const nombre of listar(dirRel)) {
    const r = `${dirRel}/${nombre}`;
    if (nombre === '.DS_Store') continue;
    if (fs.statSync(abs(r)).isDirectory()) salida.push(...listarRecursivo(r));
    else salida.push(r);
  }
  return salida;
}

// ---------------------------------------------------------------- frontmatter

function partirFrontmatter(texto) {
  const m = texto.match(/^---\n([\s\S]*?)\n---\n?/);
  if (!m) return { datos: {}, cuerpo: texto };
  const datos = {};
  for (const linea of m[1].split('\n')) {
    const kv = linea.match(/^([A-Za-z0-9_-]+):\s*(.*)$/);
    if (!kv) continue;
    let v = kv[2].trim();
    if (v.startsWith('"') && v.endsWith('"') && v.length >= 2) {
      try { v = JSON.parse(v); } catch { v = v.slice(1, -1); }
    } else if (v.startsWith("'") && v.endsWith("'") && v.length >= 2) {
      v = v.slice(1, -1).replace(/''/g, "'");
    }
    datos[kv[1]] = v;
  }
  return { datos, cuerpo: texto.slice(m[0].length) };
}

const yamlTexto = (s) => JSON.stringify(s); // una cadena JSON es una cadena YAML válida entre comillas dobles

// ---------------------------------------------------------------- inventario de la fuente

const COMANDOS = listar('.claude/commands', (d) => d.isFile() && d.name.endsWith('.md')).map((n) => n.slice(0, -3));
const SKILLS = listar('.claude/skills', (d) => d.isDirectory()).filter((n) => existe(`.claude/skills/${n}/SKILL.md`));
const AGENTES = listar('.claude/agents', (d) => d.isFile() && d.name.endsWith('.md')).map((n) => n.slice(0, -3));

// Nombre de la skill de Codex para cada comando (prefijo solo si choca con una skill existente).
const SKILL_DE_COMANDO = {};
for (const c of COMANDOS) {
  if (SKILLS.includes(c)) {
    SKILL_DE_COMANDO[c] = `cmd-${c}`;
    avisos.push(`el comando /${c} choca con la skill ${c}: en Codex se llama $cmd-${c}`);
  } else {
    SKILL_DE_COMANDO[c] = c;
  }
}

// ---------------------------------------------------------------- transformaciones de texto

// Ruta de la fuente (relativa a la raíz) → ruta equivalente en el mundo Codex.
function mapearDestino(r) {
  let m;
  if ((m = r.match(/^\.claude\/commands\/([^/]+)\.md$/)) && SKILL_DE_COMANDO[m[1]]) {
    return `.agents/skills/${SKILL_DE_COMANDO[m[1]]}/SKILL.md`;
  }
  if (r === '.claude/commands' || r === '.claude/skills') return '.agents/skills';
  if ((m = r.match(/^\.claude\/skills\/(.+)$/))) return `.agents/skills/${m[1]}`;
  if ((m = r.match(/^\.claude\/agents\/([^/]+)\.md$/))) return `.codex/agents/${m[1]}.toml`;
  if (r === '.claude/agents') return '.codex/agents';
  if (r === 'CLAUDE.md') return 'AGENTS.md';
  return r;
}

const esExterno = (t) => /^[a-z][a-z0-9+.-]*:/i.test(t) || t.startsWith('#') || t.startsWith('/');

// Reescribe los enlaces markdown relativos: se resuelven desde la ubicación de la fuente,
// se mapean al mundo Codex y se vuelven a relativizar desde la ubicación del destino.
// dirDestino: carpeta (relativa a la raíz) desde la que se leerá el enlace ('' = raíz).
function reescribirEnlaces(texto, origenRel, dirDestino) {
  const dirOrigen = posix.dirname(origenRel);
  return texto.replace(/\[([^\]\n]*)\]\(([^)\s]+)\)/g, (todo, etiqueta, destino) => {
    if (esExterno(destino)) return todo;
    const [ruta, ancla] = destino.split(/(?=#)/);
    const conBarra = ruta.endsWith('/');
    const resuelta = posix.normalize(posix.join(dirOrigen === '.' ? '' : dirOrigen, ruta)).replace(/\/$/, '');
    const mapeada = mapearDestino(resuelta);
    let nueva = posix.relative(dirDestino || '.', mapeada) || '.';
    if (conBarra && !nueva.endsWith('/')) nueva += '/';
    // Si la etiqueta era la propia ruta (o el nombre del archivo), se actualiza también.
    let nuevaEtiqueta = etiqueta;
    const sinTilde = etiqueta.replace(/`/g, '');
    if (mapeada !== resuelta) {
      if (sinTilde === ruta) nuevaEtiqueta = etiqueta.replace(ruta, mapeada + (conBarra ? '/' : ''));
      else if (sinTilde === posix.basename(resuelta)) nuevaEtiqueta = etiqueta.replace(sinTilde, posix.basename(mapeada));
    }
    return `[${nuevaEtiqueta}](${nueva}${ancla || ''})`;
  });
}

// `/comando` → `$comando` (sintaxis de skills en Codex). Solo nombres de comandos reales y
// solo cuando la barra no es parte de una ruta o URL.
function convertirBarras(texto) {
  const nombres = ordenar(COMANDOS).sort((a, b) => b.length - a.length).map((n) => n.replace(/[-]/g, '\\-'));
  if (!nombres.length) return texto;
  const re = new RegExp(`(?<![\\w./\\-$])/(${nombres.join('|')})(?![\\w\\-/.]\\w|[\\w\\-])`, 'g');
  return texto.replace(re, (_, n) => `$${SKILL_DE_COMANDO[n]}`);
}

// Los scripts de entorno: en Windows hay gemelos PowerShell.
const PS = (sub) => `powershell -ExecutionPolicy Bypass -File .claude/scripts/entorno.ps1 ${sub}`;
function anadirWindows(texto) {
  // Bloques de código cuya línea es solo el comando bash.
  texto = texto.replace(/^([ \t]*)bash \.claude\/scripts\/entorno\.sh ([a-z-]+)[ \t]*$/gm, (todo, sangria, sub, desplaz, entero) => {
    // ¿Está dentro de un bloque ``` ? Lo comprobamos contando cercas antes de la posición.
    const antes = entero.slice(0, desplaz);
    const cercas = (antes.match(/^[ \t]*```/gm) || []).length;
    if (cercas % 2 === 0) return todo;
    return `${sangria}# macOS / Linux\n${sangria}bash .claude/scripts/entorno.sh ${sub}\n${sangria}# Windows (PowerShell)\n${sangria}${PS(sub)}`;
  });
  // Menciones en línea.
  return texto.replace(/`bash \.claude\/scripts\/entorno\.sh ([a-z-]+)`(?! \(Windows)/g,
    (_, sub) => `\`bash .claude/scripts/entorno.sh ${sub}\` (Windows: \`${PS(sub)}\`)`);
}

function insertarMarca(texto, fuente) {
  const comentario = `<!-- ${MARCA} (fuente: ${fuente}) -->\n`;
  const m = texto.match(/^---\n[\s\S]*?\n---\n/);
  return m ? m[0] + comentario + texto.slice(m[0].length) : comentario + texto;
}

const normalizarFinal = (t) => t.replace(/[ \t]+$/gm, '').replace(/\n*$/, '\n');

// ---------------------------------------------------------------- generación

const generados = new Map(); // ruta relativa → contenido (string) o Buffer

function generarSkillDeComando(c) {
  const fuente = `.claude/commands/${c}.md`;
  const nombre = SKILL_DE_COMANDO[c];
  const destino = `.agents/skills/${nombre}/SKILL.md`;
  const { datos, cuerpo } = partirFrontmatter(leer(fuente));
  const base = (datos.description || `Comando ${c}`).trim().replace(/[.\s]+$/, '');
  const pista = datos['argument-hint'] ? datos['argument-hint'].trim() : '';
  const descripcion = `${convertirBarras(base)}. Úsala cuando el usuario la pida, escriba /${c} o $${nombre}.`;
  if (descripcion.length > LIMITE_DESCRIPCION) {
    errores.push(`${destino}: description supera ${LIMITE_DESCRIPCION} caracteres`);
  }
  const usaArgs = cuerpo.includes('$ARGUMENTS');
  let texto = cuerpo.replace(/\$ARGUMENTS/g, '<argumentos>');
  texto = convertirBarras(texto);
  texto = reescribirEnlaces(texto, fuente, posix.dirname(destino));
  texto = anadirWindows(texto);
  const cabecera = [
    `# $${nombre}`,
    '',
    `> En Claude Code este flujo es el comando \`/${c}\`; en Codex es esta skill (\`$${nombre}\`).`,
  ];
  if (usaArgs) {
    cabecera.push(`> \`<argumentos>\` = lo que el usuario escribió después del nombre de la skill (o, si no escribió nada, lo que pida en su mensaje).${pista ? ` Formato esperado: ${pista}` : ''}`);
  }
  const fm = `---\nname: ${nombre}\ndescription: ${yamlTexto(descripcion)}\n---\n`;
  generados.set(destino, normalizarFinal(insertarMarca(fm + cabecera.join('\n') + '\n\n' + texto.replace(/^\n+/, ''), fuente)));
}

function generarSkillCopiada(s) {
  for (const archivo of listarRecursivo(`.claude/skills/${s}`)) {
    const destino = mapearDestino(archivo);
    if (archivo.endsWith('.md')) {
      let texto = leer(archivo);
      if (archivo.endsWith('/SKILL.md')) {
        // Se reescribe el frontmatter con valores entre comillas: Claude Code tolera un ": " dentro
        // de un valor sin comillas, pero un lector YAML estricto (Codex) lo rechaza.
        const { datos, cuerpo } = partirFrontmatter(texto);
        if ((datos.description || '').length > LIMITE_DESCRIPCION) {
          errores.push(`${archivo}: description supera ${LIMITE_DESCRIPCION} caracteres`);
        }
        if (datos.name && datos.name !== s) errores.push(`${archivo}: name '${datos.name}' no coincide con la carpeta`);
        const claves = ['name', 'description', ...Object.keys(datos).filter((k) => k !== 'name' && k !== 'description')];
        const valores = { ...datos, name: datos.name || s, description: convertirBarras(datos.description || '') };
        texto = `---\n${claves.map((k) => `${k}: ${yamlTexto(valores[k])}`).join('\n')}\n---\n${cuerpo}`;
      }
      texto = convertirBarras(texto);
      texto = reescribirEnlaces(texto, archivo, posix.dirname(destino));
      texto = anadirWindows(texto);
      if (archivo.endsWith('/SKILL.md')) texto = insertarMarca(texto, archivo);
      generados.set(destino, normalizarFinal(texto));
    } else {
      generados.set(destino, fs.readFileSync(abs(archivo)));
    }
  }
}

// --- TOML

function tomlBasico(s) {
  return '"' + s.replace(/\\/g, '\\\\').replace(/"/g, '\\"').replace(/\t/g, '\\t')
    .replace(/[\u0000-\u0008\u000b-\u001f\u007f]/g, (c) => '\\u' + c.charCodeAt(0).toString(16).padStart(4, '0'))
    .replace(/\n/g, '\\n') + '"';
}

function tomlMultilinea(s) {
  const tieneControl = /[\u0000-\u0008\u000b-\u001f\u007f]/.test(s);
  if (!s.includes("'''") && !tieneControl && !s.endsWith("'")) return `'''\n${s}'''`;
  const esc = s.replace(/\\/g, '\\\\').replace(/"""/g, '""\\"')
    .replace(/[\u0000-\u0008\u000b-\u001f\u007f]/g, (c) => '\\u' + c.charCodeAt(0).toString(16).padStart(4, '0'));
  return `"""\n${esc.endsWith('"') ? esc.slice(0, -1) + '\\"' : esc}"""`;
}

// Mini-lector TOML para el subconjunto que generamos (comentarios, clave = "…" | '''…''' | """…""").
// Sirve para comprobar que lo escrito se vuelve a leer exactamente igual.
function leerTomlSimple(t) {
  const datos = {};
  let i = 0;
  const desescapar = (s) => s.replace(/\\(u[0-9a-fA-F]{4}|U[0-9a-fA-F]{8}|[btnfr"\\]|\n\s*)/g, (_, e) => {
    if (e[0] === 'u' || e[0] === 'U') return String.fromCodePoint(parseInt(e.slice(1), 16));
    if (e[0] === '\n') return '';
    return { b: '\b', t: '\t', n: '\n', f: '\f', r: '\r', '"': '"', '\\': '\\' }[e];
  });
  while (i < t.length) {
    const resto = t.slice(i);
    let m;
    if ((m = resto.match(/^[ \t]*(#[^\n]*)?\n/))) { i += m[0].length; continue; }
    if (!(m = resto.match(/^([A-Za-z0-9_-]+)[ \t]*=[ \t]*/))) throw new Error(`línea inesperada: ${resto.slice(0, 40)}`);
    const clave = m[1];
    if (clave in datos) throw new Error(`clave duplicada: ${clave}`);
    i += m[0].length;
    const v = t.slice(i);
    if (v.startsWith("'''")) {
      const fin = v.indexOf("'''", 3);
      if (fin < 0) throw new Error(`cadena ''' sin cerrar en ${clave}`);
      datos[clave] = v.slice(3, fin).replace(/^\n/, '');
      i += fin + 3;
    } else if (v.startsWith('"""')) {
      let j = 3;
      while (j < v.length) {
        if (v[j] === '\\') { j += 2; continue; }
        if (v.startsWith('"""', j) && !v.startsWith('""""', j)) break;
        j++;
      }
      if (j >= v.length) throw new Error(`cadena """ sin cerrar en ${clave}`);
      datos[clave] = desescapar(v.slice(3, j).replace(/^\n/, ''));
      i += j + 3;
    } else if (v.startsWith('"')) {
      const mm = v.match(/^"((?:[^"\\\n]|\\.)*)"/);
      if (!mm) throw new Error(`cadena sin cerrar en ${clave}`);
      datos[clave] = desescapar(mm[1]);
      i += mm[0].length;
    } else {
      throw new Error(`valor no soportado en ${clave}`);
    }
    const cola = t.slice(i).match(/^[ \t]*(#[^\n]*)?(\n|$)/);
    if (!cola) throw new Error(`basura tras el valor de ${clave}`);
    i += cola[0].length;
  }
  return datos;
}

function generarAgente(a) {
  const fuente = `.claude/agents/${a}.md`;
  const destino = `.codex/agents/${a}.toml`;
  const { datos, cuerpo } = partirFrontmatter(leer(fuente));
  const nombre = datos.name || a;
  if (nombre !== a) avisos.push(`${fuente}: name '${nombre}' no coincide con el archivo`);
  const descripcion = convertirBarras(datos.description || '');
  let instrucciones = convertirBarras(cuerpo.replace(/^\n+/, ''));
  instrucciones = reescribirEnlaces(instrucciones, fuente, ''); // los agentes corren con la raíz como cwd
  instrucciones = anadirWindows(instrucciones);
  instrucciones = normalizarFinal(instrucciones);
  const toml = [
    `# ${MARCA} (fuente: ${fuente})`,
    `# Agente personalizado de Codex. Los enlaces de developer_instructions son relativos a la raíz del espacio.`,
    `name = ${tomlBasico(nombre)}`,
    `description = ${tomlBasico(descripcion)}`,
    `developer_instructions = ${tomlMultilinea(instrucciones)}`,
    '',
  ].join('\n');
  try {
    const leido = leerTomlSimple(toml);
    if (leido.name !== nombre || leido.description !== descripcion || leido.developer_instructions !== instrucciones) {
      errores.push(`${destino}: el TOML no se relee igual que lo escrito`);
    }
  } catch (e) {
    errores.push(`${destino}: TOML inválido — ${e.message}`);
  }
  generados.set(destino, toml);
}

// --- AGENTS.md

function textoArranque() {
  const sh = leer('.claude/scripts/arranque.sh');
  const m = sh.match(/cat <<'TXT'\n([\s\S]*?)\nTXT/);
  if (!m) { errores.push('no encuentro el texto de arranque en .claude/scripts/arranque.sh'); return ''; }
  // El gemelo de Windows debe decir exactamente lo mismo.
  if (existe('.claude/scripts/arranque.ps1')) {
    const ps = leer('.claude/scripts/arranque.ps1').match(/@'\n([\s\S]*?)\n'@/);
    if (!ps || ps[1] !== m[1]) errores.push('arranque.ps1 no imprime el mismo texto que arranque.sh');
  } else {
    errores.push('falta .claude/scripts/arranque.ps1 (gemelo de Windows de arranque.sh)');
  }
  return m[1]; // ya es neutral: nombra CLAUDE.md//x y AGENTS.md/$x

}

function generarAgentsMd() {
  let t = leer('CLAUDE.md');
  t = t.replace(/^# CLAUDE\.md — /, '# AGENTS.md — ');
  t = convertirBarras(t);
  t = reescribirEnlaces(t, 'CLAUDE.md', '');
  t = anadirWindows(t);

  // La lista de comandos se convierte en la tabla de equivalencias Claude Code ↔ Codex.
  const lineas = t.split('\n');
  const salida = [];
  let enTabla = false;
  for (const l of lineas) {
    const m = l.match(/^- `\$([a-z0-9-]+)` — (.*)$/);
    const original = m && Object.keys(SKILL_DE_COMANDO).find((c) => SKILL_DE_COMANDO[c] === m[1]);
    if (m && original) {
      if (!enTabla) {
        if (salida.length && salida[salida.length - 1] !== '') salida.push('');
        salida.push('| Claude Code | Codex | Qué hace |', '|---|---|---|');
        enTabla = true;
      }
      salida.push(`| \`/${original}\` | \`$${m[1]}\` | ${m[2].replace(/\|/g, '\\|')} |`);
      continue;
    }
    enTabla = false;
    salida.push(l);
  }
  t = salida.join('\n');

  const preambulo = [
    `<!-- ${MARCA} y CLAUDE.md; luego corre: node .claude/scripts/sincronizar-codex.mjs -->`,
    '',
  ].join('\n');

  const dual = [
    '> **Un espacio, dos agentes.** Copitori funciona igual en Claude Code y en Codex. La fuente es `CLAUDE.md` + `.claude/`; este archivo, `.agents/skills/` y `.codex/agents/` se generan desde ahí.',
    '> - **Comandos** → en Claude Code son `/nombre`; en Codex son skills que se invocan con `$nombre` (o se activan solas por su descripción). Mismo nombre, mismo flujo. En este archivo aparecen con `$`.',
    '> - **Subagentes** → en Claude Code viven en `.claude/agents/`; en Codex, en `.codex/agents/` con el mismo nombre. Si en la sesión no puedes delegar, lee `.codex/agents/<nombre>.toml` y aplica su método tú mismo.',
    '> - **Scripts** → en Windows sin bash, `bash .claude/scripts/entorno.sh <sub>` se corre como `powershell -ExecutionPolicy Bypass -File .claude/scripts/entorno.ps1 <sub>`.',
    '',
    '> [!important] Primer mensaje de cada sesión (no depende de hooks)',
    '> Lee [00_perfil/identidad.md](00_perfil/identidad.md). Si `estado_configuracion` no es `CONFIGURADO`, actúa según este aviso (el mismo que inyecta el hook de arranque cuando está activo):',
    '>',
    ...textoArranque().split('\n').map((l) => (l ? `> ${l}` : '>')),
    '',
  ].join('\n');

  // El preámbulo dual va justo después del primer párrafo de identidad (antes del primer ---).
  const corte = t.indexOf('\n---\n');
  t = corte >= 0 ? t.slice(0, corte).replace(/\n+$/, '') + '\n\n' + dual + t.slice(corte) : t + '\n' + dual;
  t = normalizarFinal(preambulo + t);

  const bytes = Buffer.byteLength(t, 'utf8');
  if (bytes > LIMITE_AGENTS_MD) errores.push(`AGENTS.md ocupa ${bytes} bytes (> ${LIMITE_AGENTS_MD}); Codex lo truncaría`);
  generados.set('AGENTS.md', t);
  return bytes;
}

// ---------------------------------------------------------------- comprobación de enlaces

function enlacesRotos(rutaArchivo, texto, dirBase) {
  const rotos = [];
  const sinCodigo = texto.replace(/```[\s\S]*?```/g, '').replace(/`[^`\n]*`/g, '');
  for (const m of sinCodigo.matchAll(/\[[^\]\n]*\]\(([^)\s]+)\)/g)) {
    const destino = m[1];
    if (esExterno(destino)) continue;
    const ruta = decodeURI(destino.split('#')[0]);
    if (!ruta) continue;
    const resuelta = posix.normalize(posix.join(dirBase || '.', ruta)).replace(/\/$/, '');
    const presente = generados.has(resuelta) || existe(resuelta) ||
      [...generados.keys()].some((k) => k.startsWith(resuelta + '/'));
    if (!presente) rotos.push(`${rutaArchivo} → ${destino}`);
  }
  return rotos;
}

// ---------------------------------------------------------------- principal

const verificar = process.argv.includes('--verificar');

for (const c of COMANDOS) generarSkillDeComando(c);
for (const s of SKILLS) generarSkillCopiada(s);
for (const a of AGENTES) generarAgente(a);
const bytesAgents = generarAgentsMd();

// Enlaces de todo lo generado.
const rotos = [];
for (const [r, contenido] of generados) {
  if (typeof contenido !== 'string') continue;
  if (r.endsWith('.md')) rotos.push(...enlacesRotos(r, contenido, posix.dirname(r)));
  if (r.endsWith('.toml')) rotos.push(...enlacesRotos(r, contenido, ''));
}
for (const r of rotos) errores.push(`enlace roto: ${r}`);

// Artefactos generados que ya no tienen fuente (solo los que llevan la marca).
function obsoletos() {
  const lista = [];
  for (const d of listar('.agents/skills', (x) => x.isDirectory())) {
    const sk = `.agents/skills/${d}/SKILL.md`;
    if (existe(sk) && leer(sk).includes(MARCA) && !generados.has(sk)) lista.push(`.agents/skills/${d}`);
  }
  for (const f of listar('.codex/agents', (x) => x.isFile() && x.name.endsWith('.toml'))) {
    const r = `.codex/agents/${f}`;
    if (leer(r).includes(MARCA) && !generados.has(r)) lista.push(r);
  }
  // Archivos sobrantes dentro de carpetas de skills generadas.
  for (const d of listar('.agents/skills', (x) => x.isDirectory())) {
    const sk = `.agents/skills/${d}/SKILL.md`;
    if (!generados.has(sk)) continue;
    for (const f of listarRecursivo(`.agents/skills/${d}`)) if (!generados.has(f)) lista.push(f);
  }
  return ordenar(lista);
}

const iguales = (r, c) => {
  if (!existe(r)) return false;
  const actual = fs.readFileSync(abs(r));
  return Buffer.isBuffer(c) ? actual.equals(c) : actual.equals(Buffer.from(c, 'utf8'));
};

const desactualizados = ordenar([...generados.keys()].filter((r) => !iguales(r, generados.get(r))));
const sobrantes = obsoletos();

const nSkills = COMANDOS.length + SKILLS.length;
const resumen = `skills=${nSkills} (comandos=${COMANDOS.length}, skills=${SKILLS.length}) · agentes=${AGENTES.length} · AGENTS.md=${bytesAgents} bytes`;

for (const a of avisos) console.log(`aviso: ${a}`);

if (verificar) {
  for (const r of desactualizados) errores.push(`desactualizado: ${r}`);
  for (const r of sobrantes) errores.push(`sobrante (ya no tiene fuente): ${r}`);
  if (errores.length) {
    for (const e of errores) console.error(`✗ ${e}`);
    console.error(`\nCodex NO está sincronizado (${errores.length} problema(s)). Corre: node .claude/scripts/sincronizar-codex.mjs`);
    process.exit(1);
  }
  console.log(`✓ Codex sincronizado · ${resumen}`);
  process.exit(0);
}

if (errores.length) {
  for (const e of errores) console.error(`✗ ${e}`);
  console.error('\nNo escribo nada: corrige la fuente en .claude/ o CLAUDE.md y vuelve a correr.');
  process.exit(1);
}

for (const r of sobrantes) {
  fs.rmSync(abs(r), { recursive: true, force: true });
  console.log(`eliminado: ${r}`);
}
for (const r of desactualizados) {
  fs.mkdirSync(path.dirname(abs(r)), { recursive: true });
  fs.writeFileSync(abs(r), generados.get(r));
  console.log(`escrito: ${r}`);
}
console.log(`${desactualizados.length ? 'Listo' : 'Sin cambios'} · ${resumen}`);
