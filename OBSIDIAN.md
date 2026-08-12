# Obsidian — la vista humana de Copitori

Copitori ya era una carpeta de archivos Markdown. Con esta configuración, esa misma carpeta
es también una **bóveda de Obsidian**: Claude escribe, tú lees y navegas.

No hay sincronización ni exportación: **es el mismo archivo**. Copitori edita, Obsidian muestra.

---

## Abrirla (30 segundos)

**Lo más rápido: pídeselo a Copitori.** El comando `/instalar` instala Obsidian si te falta, registra
esta carpeta como bóveda y la abre. Se corre solo en el primer arranque; después, cuando quieras.

A mano, si lo prefieres:

1. Instala [Obsidian](https://obsidian.md) (gratis, escritorio y móvil).
2. `Abrir carpeta como bóveda` → selecciona esta carpeta (`Copitori/`).
3. Obsidian detecta `.obsidian/` y arranca ya configurado. Confía en la bóveda cuando lo pregunte.
4. Abre [[PANEL]] — es la portada.

No hace falta instalar plugins de la comunidad. Todo funciona con los plugins nucleares.

---

## Qué queda configurado

| Ajuste | Valor | Por qué |
|---|---|---|
| Enlaces | Wikilinks `[[así]]`, formato más corto | Es lo que entiende el grafo y los backlinks |
| Actualizar enlaces al mover | Activado | Renombrar dentro de Obsidian no rompe nada |
| Plantillas | `08_conocimiento/plantillas` | Las mismas que usa Copitori |
| Nota diaria | `09_bitacora/YYYY-MM-DD` con plantilla `dia.md` | El briefing del día queda archivado |
| Adjuntos | `99_adjuntos` | Nada de imágenes sueltas por la bóveda |
| Propiedades | Tipos declarados en `.obsidian/types.json` | Fechas como fechas, enlaces como enlaces |
| Grafo | Un color por carpeta | Se ve de un vistazo dónde está el peso |
| Marcadores | Panel, Tareas, Objetivos, Relaciones, Iniciativas, Decisiones, SOPs | Acceso en un clic |

Plugins nucleares activos: explorador, búsqueda, grafo, **backlinks**, enlaces salientes,
etiquetas, **propiedades**, vista previa al pasar el cursor, notas diarias, plantillas,
paleta de comandos, marcadores, esquema, contador de palabras, recuperación de archivos y lienzos.

---

## Las cuatro cosas que cambian tu día

**1. Backlinks.** Abre la ficha de un cliente y verás abajo cada acta, propuesta y decisión que
lo menciona — sin haber mantenido ningún índice.

**2. Grafo.** Un cliente sin conexiones es un cliente sin actividad. Una iniciativa colgando sola
es una iniciativa sin dueño. El grafo delata lo que las listas esconden.

**3. Propiedades.** Los campos del frontmatter (`estado`, `fecha_primer_contacto`, `valor`) se
editan como formulario y se pueden ordenar y filtrar desde la búsqueda.

**4. Móvil.** La misma bóveda en el teléfono. Lees el briefing camino a la oficina.

---

## Convenciones de enlace

Copitori sigue estas reglas al escribir; conviene que tú también:

- **Wikilinks para lo vivo**: personas, empresas, iniciativas, decisiones, reuniones → `[[Acme S.A.]]`
- **Enlaces markdown para lo estructural**: carpetas, READMEs, SOPs referenciados desde comandos
  → `[seguimiento.md](08_conocimiento/sops/seguimiento.md)`. Sobreviven fuera de Obsidian (GitHub, VS Code).
- **Enlaces en frontmatter** en formato lista, entre comillas:
  ```yaml
  relacion:
    - "[[Acme S.A.]]"
  ```
- **Embeber** en vez de copiar: `![[decisiones]]` muestra el contenido vivo, no una copia que envejece.
- **Callouts** para lo que debe saltar a la vista: `> [!warning]`, `> [!important]`, `> [!abstract]`.

---

## La regla de seguridad que importa

Obsidian actualiza los `[[wikilinks]]` cuando **tú** renombras dentro de la app. Claude trabaja a
nivel de sistema de archivos: si renombra o mueve algo por fuera, los enlaces entrantes **se rompen
en silencio**.

Por eso, en [CLAUDE.md](CLAUDE.md) está la regla: *antes de renombrar o mover cualquier nota,
buscar los wikilinks entrantes y actualizarlos en el mismo cambio*. El comando `/boveda` audita
que no haya quedado nada roto.

Si prefieres renombrar tú desde Obsidian, hazlo — es lo más seguro.

---

## Mantenimiento

Ejecuta `/boveda` cada tanto (o al cierre de semana). Revisa:

- Wikilinks rotos (apuntan a notas que no existen)
- Notas huérfanas (nadie las enlaza)
- Fichas sin frontmatter o con propiedades fuera del esquema
- Relaciones e iniciativas sin próximo paso con fecha

---

## Git y Obsidian conviviendo

`.obsidian/` **sí** se versiona: así la configuración viaja con la plantilla y cualquiera que
la clone abre la bóveda ya lista. Lo que no se versiona (ver [.gitignore](.gitignore)) es el
estado local de cada persona: `workspace.json`, caché y archivos de recuperación.

Si usas Obsidian Sync, git y Sync pueden convivir, pero no dejes que ambos escriban a la vez
en el mismo momento — cierra Obsidian antes de un `git pull` grande.
