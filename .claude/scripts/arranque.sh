#!/usr/bin/env bash
# arranque.sh — hook SessionStart. Solo lee; su salida entra como contexto de la sesión.
# Si Copitori aún no está configurado, avisa a Claude para que el primer mensaje
# del usuario (aunque sea "hola") dispare la instalación guiada.

set -uo pipefail

BOVEDA="${CLAUDE_PROJECT_DIR:-$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)}"
IDENTIDAD="$BOVEDA/00_perfil/identidad.md"

estado="SIN_ARCHIVO"
if [ -f "$IDENTIDAD" ]; then
  estado="$(grep -m1 '^estado_configuracion:' "$IDENTIDAD" \
            | sed 's/^estado_configuracion:[[:space:]]*//; s/[[:space:]]*$//' | tr -d '"')"
  [ -n "$estado" ] || estado="SIN_VALOR"
fi

# Configurado: silencio. Nada que añadir al contexto.
[ "$estado" = "CONFIGURADO" ] && exit 0

cat <<'TXT'
[Copitori · primer arranque] Este espacio todavía no está configurado
(00_perfil/identidad.md sigue en SIN_CONFIGURAR).

Responde al primer mensaje del usuario —sea cual sea, incluido un simple "hola"—
ejecutando el arranque guiado descrito en CLAUDE.md, sección "ARRANQUE":
  Paso 0 — Entorno: comando /instalar (diagnóstico, Obsidian, bóveda, estructura).
  Paso 1 — Configuración: asistente de 6 etapas (/configurar).
No respondas la petición de fondo hasta terminar el Paso 0, salvo que el usuario
pida saltárselo explícitamente.
TXT
