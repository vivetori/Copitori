# arranque.ps1 — gemelo de arranque.sh para Windows (hook SessionStart de Codex). Solo lee;
# su salida entra como contexto de la sesión.
# Si Copitori aún no está configurado, avisa al agente para que el primer mensaje
# del usuario (aunque sea "hola") dispare la instalación guiada.
#
#   powershell -NoProfile -ExecutionPolicy Bypass -File .claude\scripts\arranque.ps1

$ErrorActionPreference = 'SilentlyContinue'
try { [Console]::OutputEncoding = New-Object System.Text.UTF8Encoding $false } catch { }

# La bóveda se resuelve desde la ubicación del script: Codex no expone CLAUDE_PROJECT_DIR.
if ($env:CLAUDE_PROJECT_DIR) { $Boveda = $env:CLAUDE_PROJECT_DIR }
else { $Boveda = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path }
$Identidad = Join-Path $Boveda '00_perfil\identidad.md'

$estado = 'SIN_ARCHIVO'
if (Test-Path -LiteralPath $Identidad -PathType Leaf) {
  $linea = Get-Content -LiteralPath $Identidad -Encoding UTF8 |
    Where-Object { $_ -match '^estado_configuracion:' } | Select-Object -First 1
  $estado = ''
  if ($linea) { $estado = ($linea -replace '^estado_configuracion:\s*', '').Trim().Replace('"', '') }
  if (-not $estado) { $estado = 'SIN_VALOR' }
}

# Configurado: silencio. Nada que añadir al contexto.
if ($estado -eq 'CONFIGURADO') { exit 0 }

@'
[Copitori · primer arranque] Este espacio todavía no está configurado
(00_perfil/identidad.md sigue en SIN_CONFIGURAR).

Responde al primer mensaje del usuario —sea cual sea, incluido un simple "hola"—
ejecutando el arranque guiado de la sección "ARRANQUE" de las instrucciones del
proyecto (CLAUDE.md en Claude Code, AGENTS.md en Codex):
  Paso 0 — Entorno: /instalar en Claude Code, $instalar en Codex
           (diagnóstico, Obsidian, bóveda, estructura).
  Paso 1 — Configuración: asistente de 6 etapas (/configurar o $configurar).
No respondas la petición de fondo hasta terminar el Paso 0, salvo que el usuario
pida saltárselo explícitamente.
'@ | Write-Output
exit 0
