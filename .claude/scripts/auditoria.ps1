# auditoria.ps1 — gemelo de Windows del hook de auditoría de MCPs (PostToolUse).
# Lee el JSON del evento por la entrada estándar y lo añade como una línea a
# .claude/logs/auditoria.jsonl (UTF-8 sin BOM). Nunca falla la sesión: ante cualquier error, sale en silencio.
#
#   powershell -NoProfile -ExecutionPolicy Bypass -File .claude\scripts\auditoria.ps1

try {
  $Boveda = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
  $Logs = Join-Path $Boveda '.claude\logs'
  if (-not (Test-Path -LiteralPath $Logs)) { New-Item -ItemType Directory -Force -Path $Logs | Out-Null }
  $entrada = New-Object System.IO.StreamReader([Console]::OpenStandardInput(), (New-Object System.Text.UTF8Encoding $false))
  $evento = $entrada.ReadToEnd().Trim()
  if ($evento) {
    $evento = ($evento -replace "`r?`n", ' ') + "`n"
    [System.IO.File]::AppendAllText((Join-Path $Logs 'auditoria.jsonl'), $evento, (New-Object System.Text.UTF8Encoding $false))
  }
} catch { }
exit 0
