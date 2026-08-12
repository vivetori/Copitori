#!/usr/bin/env bash
# entorno.sh — instalador y doctor del entorno de Copitori.
#
#   bash .claude/scripts/entorno.sh verificar            diagnóstico (no modifica nada)
#   bash .claude/scripts/entorno.sh instalar-obsidian    instala Obsidian con el gestor del sistema
#   bash .claude/scripts/entorno.sh abrir-boveda         registra esta carpeta como bóveda y la abre
#   bash .claude/scripts/entorno.sh reparar-estructura   crea las carpetas que falten
#
# Todo lo que modifica el sistema está en subcomandos explícitos: `verificar` solo lee.

set -uo pipefail

BOVEDA="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
NOMBRE_BOVEDA="$(basename "$BOVEDA")"

case "$(uname -s)" in
  Darwin)               SO="macos";   CFG_OBS="$HOME/Library/Application Support/obsidian/obsidian.json" ;;
  Linux)                SO="linux";   CFG_OBS="$HOME/.config/obsidian/obsidian.json" ;;
  MINGW*|MSYS*|CYGWIN*) SO="windows"; CFG_OBS="${APPDATA:-$HOME/AppData/Roaming}/obsidian/obsidian.json" ;;
  *)                    SO="desconocido"; CFG_OBS="" ;;
esac

CARPETAS="00_perfil 01_objetivos 02_relaciones 03_iniciativas 04_comercial 05_finanzas
06_comunicacion 07_equipo 08_conocimiento 08_conocimiento/plantillas 08_conocimiento/sops
09_bitacora 99_adjuntos .claude/commands .claude/agents .claude/skills .claude/scripts .obsidian"

ARCHIVOS="CLAUDE.md PANEL.md README.md TASKS.md OBSIDIAN.md
00_perfil/identidad.md 00_perfil/organizacion.md 00_perfil/config_copiloto.md
01_objetivos/okrs.md .obsidian/app.json .obsidian/core-plugins.json"

# ---------------------------------------------------------------- utilidades

ok()   { printf '  ✓ %s\n' "$1"; }
falta(){ printf '  ✗ %s\n' "$1"; }
aviso(){ printf '  ! %s\n' "$1"; }

ruta_obsidian() {
  case "$SO" in
    macos)
      for r in "/Applications/Obsidian.app" "$HOME/Applications/Obsidian.app"; do
        [ -d "$r" ] && { printf '%s' "$r"; return 0; }
      done ;;
    linux)
      if command -v obsidian >/dev/null 2>&1; then command -v obsidian; return 0; fi
      if command -v flatpak >/dev/null 2>&1 && flatpak info md.obsidian.Obsidian >/dev/null 2>&1; then
        printf 'flatpak:md.obsidian.Obsidian'; return 0
      fi
      for r in "$HOME/Applications"/Obsidian*.AppImage /opt/Obsidian*; do
        [ -e "$r" ] && { printf '%s' "$r"; return 0; }
      done ;;
    windows)
      for r in "${LOCALAPPDATA:-$HOME/AppData/Local}/Obsidian/Obsidian.exe" \
               "/c/Program Files/Obsidian/Obsidian.exe"; do
        [ -e "$r" ] && { printf '%s' "$r"; return 0; }
      done ;;
  esac
  return 1
}

gestor_paquetes() {
  case "$SO" in
    macos)   command -v brew    >/dev/null 2>&1 && { echo brew;    return 0; } ;;
    windows) command -v winget  >/dev/null 2>&1 && { echo winget;  return 0; } ;;
    linux)   command -v flatpak >/dev/null 2>&1 && { echo flatpak; return 0; }
             command -v snap    >/dev/null 2>&1 && { echo snap;    return 0; } ;;
  esac
  echo ninguno
}

obsidian_corriendo() {
  case "$SO" in
    macos)   pgrep -x Obsidian     >/dev/null 2>&1 ;;
    linux)   pgrep -f obsidian     >/dev/null 2>&1 ;;
    windows) tasklist 2>/dev/null | grep -qi '^Obsidian.exe' ;;
    *) return 1 ;;
  esac
}

boveda_registrada() {
  # La comilla final evita que una bóveda cuyo nombre sea prefijo de otra dé falso positivo.
  [ -n "$CFG_OBS" ] && [ -f "$CFG_OBS" ] && grep -qF "$BOVEDA\"" "$CFG_OBS"
}

# Intérprete disponible para editar JSON sin romperlo. Evita el /usr/bin/python3 de
# macOS (es un stub que dispara la instalación de las Command Line Tools).
motor_json() {
  command -v jq   >/dev/null 2>&1 && { echo jq;   return 0; }
  command -v node >/dev/null 2>&1 && { echo node; return 0; }
  for p in /opt/homebrew/bin/python3 /usr/local/bin/python3; do
    [ -x "$p" ] && { echo "$p"; return 0; }
  done
  echo ninguno
}

estado_configuracion() {
  local f="$BOVEDA/00_perfil/identidad.md"
  [ -f "$f" ] || { echo "SIN_ARCHIVO"; return; }
  grep -m1 '^estado_configuracion:' "$f" \
    | sed 's/^estado_configuracion:[[:space:]]*//; s/[[:space:]]*$//' \
    | tr -d '"' | grep . || echo "SIN_VALOR"
}

carpetas_faltantes() {
  local f="" d=""
  for d in $CARPETAS; do
    [ -d "$BOVEDA/$d" ] || f="$f,$d"
  done
  printf '%s' "${f#,}"
}

archivos_faltantes() {
  local f="" a=""
  for a in $ARCHIVOS; do
    [ -f "$BOVEDA/$a" ] || f="$f,$a"
  done
  printf '%s' "${f#,}"
}

# ---------------------------------------------------------------- verificar

cmd_verificar() {
  local obs gest cfg_estado carpetas archivos conf motor
  obs="$(ruta_obsidian || true)"
  gest="$(gestor_paquetes)"
  carpetas="$(carpetas_faltantes)"
  archivos="$(archivos_faltantes)"
  conf="$(estado_configuracion)"
  motor="$(motor_json)"

  echo "=== Copitori · diagnóstico de entorno ==="
  echo "Bóveda: $BOVEDA"
  echo "Sistema: $SO"
  echo
  echo "Obsidian"
  if [ -n "$obs" ]; then ok "instalado ($obs)"; else falta "no instalado"; fi
  if [ -n "$obs" ]; then
    if boveda_registrada; then ok "esta carpeta ya está registrada como bóveda"
    else falta "la carpeta aún no está registrada como bóveda"; fi
    obsidian_corriendo && aviso "Obsidian está abierto ahora mismo"
  fi
  if [ -z "$obs" ]; then
    if [ "$gest" = ninguno ]; then
      falta "sin gestor de paquetes ($SO): habrá que descargarlo de obsidian.md/download"
    else
      ok "se puede instalar con $gest"
    fi
  fi
  echo
  echo "Estructura de la bóveda"
  if [ -z "$carpetas" ]; then ok "todas las carpetas presentes"; else falta "faltan carpetas: $carpetas"; fi
  if [ -z "$archivos" ]; then ok "todos los archivos base presentes"; else falta "faltan archivos: $archivos"; fi
  if [ -d "$BOVEDA/.git" ]; then ok "repositorio git"; else aviso "sin git (opcional, pero da historial y respaldo)"; fi
  echo
  echo "Configuración de Copitori"
  case "$conf" in
    CONFIGURADO) ok "perfil configurado" ;;
    *)           falta "perfil sin configurar ($conf)" ;;
  esac
  echo
  echo "--- ESTADO ---"
  echo "so=$SO"
  echo "obsidian=$([ -n "$obs" ] && echo instalado || echo falta)"
  echo "obsidian_ruta=${obs:-}"
  echo "obsidian_corriendo=$(obsidian_corriendo && echo si || echo no)"
  echo "boveda_registrada=$(boveda_registrada && echo si || echo no)"
  echo "gestor=$gest"
  echo "motor_json=$motor"
  echo "carpetas_faltantes=${carpetas:-ninguna}"
  echo "archivos_faltantes=${archivos:-ninguno}"
  echo "git=$([ -d "$BOVEDA/.git" ] && echo si || echo no)"
  echo "configuracion=$conf"
}

# ------------------------------------------------------- instalar Obsidian

cmd_instalar_obsidian() {
  if ruta_obsidian >/dev/null; then
    echo "Obsidian ya está instalado en $(ruta_obsidian). Nada que hacer."
    return 0
  fi
  case "$(gestor_paquetes)" in
    brew)
      echo "Instalando Obsidian con Homebrew…"
      brew install --cask obsidian ;;
    winget)
      echo "Instalando Obsidian con winget…"
      winget install -e --id Obsidian.Obsidian ;;
    flatpak)
      echo "Instalando Obsidian con Flatpak…"
      flatpak install -y flathub md.obsidian.Obsidian ;;
    snap)
      echo "Instalando Obsidian con snap…"
      sudo snap install obsidian --classic ;;
    *)
      cat <<TXT
No hay gestor de paquetes en este sistema ($SO).

Descarga Obsidian a mano (gratis, 1 minuto): https://obsidian.md/download
En macOS, si prefieres tener gestor de paquetes para la próxima:
  /bin/bash -c "\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
TXT
      return 2 ;;
  esac
  if ruta_obsidian >/dev/null; then
    echo "Listo: Obsidian instalado en $(ruta_obsidian)."
  else
    echo "La instalación terminó pero no encuentro Obsidian. Revisa la salida de arriba."
    return 1
  fi
}

# ---------------------------------------------------- registrar y abrir bóveda

instrucciones_manuales() {
  cat <<TXT
Ábrela a mano (2 clics):
  1. Abre Obsidian.
  2. "Abrir carpeta como bóveda" / "Open folder as vault".
  3. Selecciona: $BOVEDA
  4. Confía en la bóveda cuando lo pregunte (usa la configuración de .obsidian/).
TXT
}

registrar_boveda() {
  local id ts motor tmp
  [ -n "$CFG_OBS" ] || { echo "Sistema no soportado para registro automático."; return 1; }

  if boveda_registrada; then
    echo "La bóveda ya estaba registrada en Obsidian."
    return 0
  fi

  if obsidian_corriendo; then
    echo "Obsidian está abierto: si escribo su configuración ahora, la sobrescribirá al cerrarse."
    instrucciones_manuales
    return 3
  fi

  id="$(od -An -tx1 -N8 /dev/urandom 2>/dev/null | tr -d ' \n')"
  [ -n "$id" ] || id="$(date +%s%N | md5 2>/dev/null | cut -c1-16)"
  ts="$(( $(date +%s) * 1000 ))"
  mkdir -p "$(dirname "$CFG_OBS")"

  # Config nueva (Obsidian nunca se ha abierto): la escribimos entera.
  if [ ! -s "$CFG_OBS" ]; then
    printf '{"vaults":{"%s":{"path":"%s","ts":%s,"open":true}}}\n' "$id" "$BOVEDA" "$ts" > "$CFG_OBS"
    echo "Bóveda registrada (configuración nueva de Obsidian)."
    return 0
  fi

  # Config existente: respaldo + edición con un motor que no rompa el JSON.
  cp "$CFG_OBS" "$CFG_OBS.copitori-bak-$(date +%Y%m%d%H%M%S)"
  motor="$(motor_json)"
  case "$motor" in
    jq)
      tmp="$(mktemp)"
      if jq -c --arg id "$id" --arg p "$BOVEDA" --argjson ts "$ts" \
            '.vaults[$id] = {path:$p, ts:$ts, open:true}' "$CFG_OBS" > "$tmp"; then
        mv "$tmp" "$CFG_OBS"
      else
        rm -f "$tmp"; echo "jq falló."; instrucciones_manuales; return 3
      fi ;;
    node)
      node -e '
        const fs=require("fs");
        const [cfg,ruta,id,ts]=process.argv.slice(1);
        let j={}; try{ j=JSON.parse(fs.readFileSync(cfg,"utf8")); }catch(e){ j={}; }
        j.vaults=j.vaults||{};
        j.vaults[id]={path:ruta,ts:Number(ts),open:true};
        fs.writeFileSync(cfg,JSON.stringify(j));
      ' "$CFG_OBS" "$BOVEDA" "$id" "$ts" || { echo "node falló."; instrucciones_manuales; return 3; } ;;
    ninguno)
      echo "No hay jq, node ni python3 para editar la configuración de Obsidian sin riesgo."
      instrucciones_manuales
      return 3 ;;
    *)
      "$motor" -c '
import json,sys
cfg,ruta,vid,ts = sys.argv[1:5]
try:
    with open(cfg) as f: j = json.load(f)
except Exception:
    j = {}
j.setdefault("vaults", {})[vid] = {"path": ruta, "ts": int(ts), "open": True}
with open(cfg, "w") as f: json.dump(j, f)
' "$CFG_OBS" "$BOVEDA" "$id" "$ts" || { echo "python3 falló."; instrucciones_manuales; return 3; } ;;
  esac

  echo "Bóveda registrada en Obsidian (respaldo de la config previa guardado junto al original)."
}

cmd_abrir_boveda() {
  local uri nombre
  if ! ruta_obsidian >/dev/null; then
    echo "Obsidian no está instalado. Corre primero: bash .claude/scripts/entorno.sh instalar-obsidian"
    return 1
  fi

  registrar_boveda
  local rc=$?
  [ $rc -eq 3 ] && return 0   # ya se dieron instrucciones manuales
  [ $rc -ne 0 ] && return $rc

  nombre="$(printf '%s' "$NOMBRE_BOVEDA" | sed 's/ /%20/g')"
  uri="obsidian://open?vault=$nombre"
  case "$SO" in
    macos)   open "$uri" ;;
    linux)   xdg-open "$uri" >/dev/null 2>&1 || echo "Abre esta URL en tu navegador: $uri" ;;
    windows) cmd //c start "" "$uri" >/dev/null 2>&1 || echo "Abre esta URL: $uri" ;;
    *)       echo "Abre esta URL: $uri" ;;
  esac
  echo "Obsidian abriendo la bóveda '$NOMBRE_BOVEDA'. La portada es PANEL.md."
}

# ------------------------------------------------------- reparar estructura

cmd_reparar_estructura() {
  local d creadas=0
  for d in $CARPETAS; do
    if [ ! -d "$BOVEDA/$d" ]; then
      mkdir -p "$BOVEDA/$d"
      echo "creada: $d"
      creadas=$((creadas+1))
    fi
    # .gitkeep solo en carpetas de datos vacías, para que git las conserve
    case "$d" in
      .claude/*|.obsidian) ;;
      *)
        if [ -z "$(ls -A "$BOVEDA/$d" 2>/dev/null)" ]; then
          : > "$BOVEDA/$d/.gitkeep"
        fi ;;
    esac
  done
  [ "$creadas" -eq 0 ] && echo "La estructura ya estaba completa."
  local faltan; faltan="$(archivos_faltantes)"
  [ -n "$faltan" ] && echo "Ojo: faltan archivos base que este script no inventa: $faltan"
  return 0
}

# ---------------------------------------------------------------- despacho

case "${1:-verificar}" in
  verificar)           cmd_verificar ;;
  instalar-obsidian)   cmd_instalar_obsidian ;;
  abrir-boveda)        cmd_abrir_boveda ;;
  reparar-estructura)  cmd_reparar_estructura ;;
  *)
    echo "Uso: bash .claude/scripts/entorno.sh {verificar|instalar-obsidian|abrir-boveda|reparar-estructura}"
    exit 64 ;;
esac
