# entorno.ps1 — instalador y doctor del entorno de Copitori para Windows (gemelo de entorno.sh).
#
#   powershell -ExecutionPolicy Bypass -File .claude/scripts/entorno.ps1 verificar            diagnóstico (no modifica nada)
#   powershell -ExecutionPolicy Bypass -File .claude/scripts/entorno.ps1 instalar-obsidian    instala Obsidian con winget
#   powershell -ExecutionPolicy Bypass -File .claude/scripts/entorno.ps1 abrir-boveda         registra esta carpeta como bóveda y la abre
#   powershell -ExecutionPolicy Bypass -File .claude/scripts/entorno.ps1 reparar-estructura   crea las carpetas que falten
#
# Todo lo que modifica el sistema está en subcomandos explícitos: `verificar` solo lee.
# Mantén la salida (y el bloque --- ESTADO ---) alineada con entorno.sh: los comandos de Copitori la leen igual.
# Compatible con Windows PowerShell 5.1 y PowerShell 7.

param([string]$Subcomando = 'verificar')

$ErrorActionPreference = 'Continue'
try { [Console]::OutputEncoding = New-Object System.Text.UTF8Encoding $false } catch { }

$Boveda = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
$NombreBoveda = Split-Path -Leaf $Boveda
$Utf8SinBom = New-Object System.Text.UTF8Encoding $false

# Sistema: en PowerShell 7 existen $IsMacOS/$IsLinux; en Windows PowerShell 5.1 no (y siempre es Windows).
if ((Test-Path variable:IsMacOS) -and $IsMacOS) {
  $SO = 'macos'; $CfgObs = Join-Path $HOME 'Library/Application Support/obsidian/obsidian.json'
} elseif ((Test-Path variable:IsLinux) -and $IsLinux) {
  $SO = 'linux'; $CfgObs = Join-Path $HOME '.config/obsidian/obsidian.json'
} else {
  $SO = 'windows'
  $appdata = if ($env:APPDATA) { $env:APPDATA } else { Join-Path $HOME 'AppData\Roaming' }
  $CfgObs = Join-Path $appdata 'obsidian\obsidian.json'
}

$Carpetas = @('00_perfil', '01_objetivos', '02_relaciones', '03_iniciativas', '04_comercial', '05_finanzas',
  '06_comunicacion', '07_equipo', '08_conocimiento', '08_conocimiento/plantillas', '08_conocimiento/plantillas/proyecto',
  '08_conocimiento/sops', '09_bitacora', '99_adjuntos', '.claude/commands', '.claude/agents', '.claude/skills',
  '.claude/scripts', '.obsidian', '.agents/skills', '.codex', '.codex/agents')

$Archivos = @('CLAUDE.md', 'AGENTS.md', 'PANEL.md', 'README.md', 'TASKS.md', 'OBSIDIAN.md',
  '00_perfil/identidad.md', '00_perfil/organizacion.md', '00_perfil/config_copiloto.md',
  '01_objetivos/okrs.md', '.obsidian/app.json', '.obsidian/core-plugins.json')

# ---------------------------------------------------------------- utilidades

function Ok([string]$m)    { Write-Output "  ✓ $m" }
function Falta([string]$m) { Write-Output "  ✗ $m" }
function Aviso([string]$m) { Write-Output "  ! $m" }
function Ruta([string]$r)  { Join-Path $Boveda ($r -replace '/', [IO.Path]::DirectorySeparatorChar) }
function Hay([string]$cmd) { [bool](Get-Command $cmd -ErrorAction SilentlyContinue) }

function Ruta-Obsidian {
  switch ($SO) {
    'windows' {
      $local = if ($env:LOCALAPPDATA) { $env:LOCALAPPDATA } else { Join-Path $HOME 'AppData\Local' }
      $candidatas = @((Join-Path $local 'Programs\Obsidian\Obsidian.exe'), (Join-Path $local 'Obsidian\Obsidian.exe'))
      if ($env:ProgramFiles) { $candidatas += (Join-Path $env:ProgramFiles 'Obsidian\Obsidian.exe') }
      foreach ($r in $candidatas) { if (Test-Path -LiteralPath $r) { return $r } }
    }
    'macos' {
      foreach ($r in @('/Applications/Obsidian.app', (Join-Path $HOME 'Applications/Obsidian.app'))) {
        if (Test-Path -LiteralPath $r) { return $r }
      }
    }
    'linux' {
      $c = Get-Command obsidian -ErrorAction SilentlyContinue
      if ($c) { return $c.Source }
    }
  }
  return $null
}

function Gestor-Paquetes {
  switch ($SO) {
    'windows' { if (Hay 'winget') { return 'winget' } }
    'macos'   { if (Hay 'brew') { return 'brew' } }
    'linux'   { if (Hay 'flatpak') { return 'flatpak' }; if (Hay 'snap') { return 'snap' } }
  }
  return 'ninguno'
}

function Obsidian-Corriendo {
  [bool](Get-Process -Name 'Obsidian' -ErrorAction SilentlyContinue)
}

function Leer-ConfigObsidian {
  if (-not (Test-Path -LiteralPath $CfgObs)) { return $null }
  $texto = [IO.File]::ReadAllText($CfgObs)
  if (-not $texto.Trim()) { return $null }
  return ($texto | ConvertFrom-Json)
}

function Boveda-Registrada {
  try {
    $cfg = Leer-ConfigObsidian
    if (-not $cfg -or -not $cfg.vaults) { return $false }
    foreach ($p in $cfg.vaults.PSObject.Properties) {
      $ruta = [string]$p.Value.path
      if ($ruta -and ($ruta.TrimEnd('\', '/') -ieq $Boveda.TrimEnd('\', '/'))) { return $true }
    }
  } catch { }
  return $false
}

function Estado-Configuracion {
  $f = Ruta '00_perfil/identidad.md'
  if (-not (Test-Path -LiteralPath $f)) { return 'SIN_ARCHIVO' }
  $linea = Get-Content -LiteralPath $f -Encoding UTF8 | Where-Object { $_ -match '^estado_configuracion:' } | Select-Object -First 1
  if (-not $linea) { return 'SIN_VALOR' }
  $v = ($linea -replace '^estado_configuracion:\s*', '').Trim().Replace('"', '')
  if ($v) { return $v } else { return 'SIN_VALOR' }
}

function Carpetas-Faltantes { ($Carpetas | Where-Object { -not (Test-Path -LiteralPath (Ruta $_) -PathType Container) }) -join ',' }
function Archivos-Faltantes { ($Archivos | Where-Object { -not (Test-Path -LiteralPath (Ruta $_) -PathType Leaf) }) -join ',' }

# Codex: CLI presente y artefactos generados (AGENTS.md, .agents/skills, .codex/agents) al día.
function Codex-Sincronizado {
  if (-not (Hay 'node')) { return 'sin_node' }
  & node (Ruta '.claude/scripts/sincronizar-codex.mjs') --verificar *> $null
  if ($LASTEXITCODE -eq 0) { return 'si' } else { return 'no' }
}

function SiNo([bool]$b) { if ($b) { 'si' } else { 'no' } }

# ---------------------------------------------------------------- verificar

function Cmd-Verificar {
  $obs = Ruta-Obsidian
  $gest = Gestor-Paquetes
  $carpetas = Carpetas-Faltantes
  $archivos = Archivos-Faltantes
  $conf = Estado-Configuracion
  $corriendo = Obsidian-Corriendo
  $registrada = Boveda-Registrada
  $git = Test-Path -LiteralPath (Ruta '.git')
  $codex = Hay 'codex'
  $sinc = Codex-Sincronizado
  # No hay motor JSON externo que elegir: PowerShell edita JSON por sí mismo.
  $motor = 'powershell'

  Write-Output '=== Copitori · diagnóstico de entorno ==='
  Write-Output "Bóveda: $Boveda"
  Write-Output "Sistema: $SO"
  Write-Output ''
  Write-Output 'Obsidian'
  if ($obs) { Ok "instalado ($obs)" } else { Falta 'no instalado' }
  if ($obs) {
    if ($registrada) { Ok 'esta carpeta ya está registrada como bóveda' }
    else { Falta 'la carpeta aún no está registrada como bóveda' }
    if ($corriendo) { Aviso 'Obsidian está abierto ahora mismo' }
  } else {
    if ($gest -eq 'ninguno') { Falta "sin gestor de paquetes ($SO): habrá que descargarlo de obsidian.md/download" }
    else { Ok "se puede instalar con $gest" }
  }
  Write-Output ''
  Write-Output 'Estructura de la bóveda'
  if (-not $carpetas) { Ok 'todas las carpetas presentes' } else { Falta "faltan carpetas: $carpetas" }
  if (-not $archivos) { Ok 'todos los archivos base presentes' } else { Falta "faltan archivos: $archivos" }
  if ($git) { Ok 'repositorio git' } else { Aviso 'sin git (opcional, pero da historial y respaldo)' }
  Write-Output ''
  Write-Output 'Codex (opcional; Claude Code no lo necesita)'
  if ($codex) { Ok "Codex CLI instalado ($((Get-Command codex).Source))" }
  else { Aviso 'Codex CLI no encontrado (la app o la extensión del IDE también sirven)' }
  switch ($sinc) {
    'si'       { Ok 'AGENTS.md, .agents/skills y .codex/agents al día con .claude/' }
    'no'       { Falta 'artefactos de Codex desactualizados: corre node .claude/scripts/sincronizar-codex.mjs' }
    'sin_node' { Aviso 'sin node: no puedo comprobar si los artefactos de Codex están al día' }
  }
  Write-Output ''
  Write-Output 'Configuración de Copitori'
  if ($conf -eq 'CONFIGURADO') { Ok 'perfil configurado' } else { Falta "perfil sin configurar ($conf)" }
  Write-Output ''
  Write-Output '--- ESTADO ---'
  Write-Output "so=$SO"
  Write-Output "obsidian=$(if ($obs) { 'instalado' } else { 'falta' })"
  Write-Output "obsidian_ruta=$obs"
  Write-Output "obsidian_corriendo=$(SiNo $corriendo)"
  Write-Output "boveda_registrada=$(SiNo $registrada)"
  Write-Output "gestor=$gest"
  Write-Output "motor_json=$motor"
  Write-Output "carpetas_faltantes=$(if ($carpetas) { $carpetas } else { 'ninguna' })"
  Write-Output "archivos_faltantes=$(if ($archivos) { $archivos } else { 'ninguno' })"
  Write-Output "git=$(SiNo $git)"
  Write-Output "codex_cli=$(SiNo $codex)"
  Write-Output "codex_sincronizado=$sinc"
  Write-Output "configuracion=$conf"
  $script:Codigo = 0; return
}

# ------------------------------------------------------- instalar Obsidian

function Cmd-InstalarObsidian {
  $ya = Ruta-Obsidian
  if ($ya) { Write-Output "Obsidian ya está instalado en $ya. Nada que hacer."; $script:Codigo = 0; return }
  switch (Gestor-Paquetes) {
    'winget'  { Write-Output 'Instalando Obsidian con winget…'
                & winget install -e --id Obsidian.Obsidian --accept-source-agreements --accept-package-agreements }
    'brew'    { Write-Output 'Instalando Obsidian con Homebrew…'; & brew install --cask obsidian }
    'flatpak' { Write-Output 'Instalando Obsidian con Flatpak…'; & flatpak install -y flathub md.obsidian.Obsidian }
    'snap'    { Write-Output 'Instalando Obsidian con snap…'; & sudo snap install obsidian --classic }
    default {
      Write-Output "No hay gestor de paquetes en este sistema ($SO)."
      Write-Output ''
      Write-Output 'Descarga Obsidian a mano (gratis, 1 minuto): https://obsidian.md/download'
      Write-Output 'En Windows, winget viene con el "Instalador de aplicación" de Microsoft Store si prefieres tener gestor para la próxima.'
      $script:Codigo = 2; return
    }
  }
  $ruta = Ruta-Obsidian
  if ($ruta) { Write-Output "Listo: Obsidian instalado en $ruta."; $script:Codigo = 0; return }
  Write-Output 'La instalación terminó pero no encuentro Obsidian. Revisa la salida de arriba.'
  $script:Codigo = 1; return
}

# ---------------------------------------------------- registrar y abrir bóveda

function Instrucciones-Manuales {
  Write-Output 'Ábrela a mano (2 clics):'
  Write-Output '  1. Abre Obsidian.'
  Write-Output '  2. "Abrir carpeta como bóveda" / "Open folder as vault".'
  Write-Output "  3. Selecciona: $Boveda"
  Write-Output '  4. Confía en la bóveda cuando lo pregunte (usa la configuración de .obsidian/).'
}

# Deja en $script:Codigo: 0 = registrada, 3 = se dieron instrucciones manuales, otro = error.
# (Las funciones Cmd-* no devuelven valores: en PowerShell todo lo que se devuelve se mezcla con la salida.)
function Registrar-Boveda {
  if (Boveda-Registrada) { Write-Output 'La bóveda ya estaba registrada en Obsidian.'; $script:Codigo = 0; return }

  if (Obsidian-Corriendo) {
    Write-Output 'Obsidian está abierto: si escribo su configuración ahora, la sobrescribirá al cerrarse.'
    Instrucciones-Manuales
    $script:Codigo = 3; return
  }

  $bytes = New-Object byte[] 8
  (New-Object System.Security.Cryptography.RNGCryptoServiceProvider).GetBytes($bytes)
  $id = -join ($bytes | ForEach-Object { $_.ToString('x2') })
  $ts = [long]([DateTimeOffset]::UtcNow.ToUnixTimeMilliseconds())
  $dir = Split-Path -Parent $CfgObs
  if (-not (Test-Path -LiteralPath $dir)) { New-Item -ItemType Directory -Force -Path $dir | Out-Null }

  # Config nueva (Obsidian nunca se ha abierto): la escribimos entera.
  $existe = (Test-Path -LiteralPath $CfgObs) -and ((Get-Item -LiteralPath $CfgObs).Length -gt 0)
  if (-not $existe) {
    $json = @{ vaults = @{ $id = [ordered]@{ path = $Boveda; ts = $ts; open = $true } } } | ConvertTo-Json -Depth 10 -Compress
    [IO.File]::WriteAllText($CfgObs, $json + "`n", $Utf8SinBom)
    Write-Output 'Bóveda registrada (configuración nueva de Obsidian).'
    $script:Codigo = 0; return
  }

  # Config existente: respaldo + edición con el parser JSON de PowerShell.
  Copy-Item -LiteralPath $CfgObs -Destination ("$CfgObs.copitori-bak-" + (Get-Date -Format 'yyyyMMddHHmmss'))
  try {
    $cfg = Leer-ConfigObsidian
    if (-not $cfg) { $cfg = New-Object PSObject }
    if (-not ($cfg.PSObject.Properties.Name -contains 'vaults') -or -not $cfg.vaults) {
      $cfg | Add-Member -NotePropertyName vaults -NotePropertyValue (New-Object PSObject) -Force
    }
    $cfg.vaults | Add-Member -NotePropertyName $id -NotePropertyValue ([pscustomobject][ordered]@{ path = $Boveda; ts = $ts; open = $true }) -Force
    $json = $cfg | ConvertTo-Json -Depth 20 -Compress
    [IO.File]::WriteAllText($CfgObs, $json, $Utf8SinBom)
  } catch {
    Write-Output "No pude editar la configuración de Obsidian: $($_.Exception.Message)"
    Instrucciones-Manuales
    $script:Codigo = 3; return
  }
  Write-Output 'Bóveda registrada en Obsidian (respaldo de la config previa guardado junto al original).'
  $script:Codigo = 0; return
}

function Cmd-AbrirBoveda {
  if (-not (Ruta-Obsidian)) {
    Write-Output 'Obsidian no está instalado. Corre primero: powershell -ExecutionPolicy Bypass -File .claude/scripts/entorno.ps1 instalar-obsidian'
    $script:Codigo = 1; return
  }
  Registrar-Boveda
  if ($script:Codigo -eq 3) { $script:Codigo = 0; return }   # ya se dieron instrucciones manuales
  if ($script:Codigo -ne 0) { return }

  $uri = 'obsidian://open?vault=' + [Uri]::EscapeDataString($NombreBoveda)
  try { Start-Process $uri } catch { Write-Output "Abre esta URL: $uri" }
  Write-Output "Obsidian abriendo la bóveda '$NombreBoveda'. La portada es PANEL.md."
  $script:Codigo = 0; return
}

# ------------------------------------------------------- reparar estructura

function Cmd-RepararEstructura {
  $creadas = 0
  foreach ($d in $Carpetas) {
    $p = Ruta $d
    if (-not (Test-Path -LiteralPath $p -PathType Container)) {
      New-Item -ItemType Directory -Force -Path $p | Out-Null
      Write-Output "creada: $d"
      $creadas++
    }
    # .gitkeep solo en carpetas de datos vacías, para que git las conserve
    if ($d -notmatch '^\.(claude|agents|codex)(/|$)' -and $d -ne '.obsidian') {
      if (-not (Get-ChildItem -LiteralPath $p -Force -ErrorAction SilentlyContinue | Select-Object -First 1)) {
        [IO.File]::WriteAllText((Join-Path $p '.gitkeep'), '', $Utf8SinBom)
      }
    }
  }
  if ($creadas -eq 0) { Write-Output 'La estructura ya estaba completa.' }
  $faltan = Archivos-Faltantes
  if ($faltan) { Write-Output "Ojo: faltan archivos base que este script no inventa: $faltan" }
  $script:Codigo = 0; return
}

# ---------------------------------------------------------------- despacho

$script:Codigo = 0
switch ($Subcomando) {
  'verificar'          { Cmd-Verificar }
  'instalar-obsidian'  { Cmd-InstalarObsidian }
  'abrir-boveda'       { Cmd-AbrirBoveda }
  'reparar-estructura' { Cmd-RepararEstructura }
  default {
    Write-Output 'Uso: powershell -ExecutionPolicy Bypass -File .claude/scripts/entorno.ps1 {verificar|instalar-obsidian|abrir-boveda|reparar-estructura}'
    exit 64
  }
}
exit $script:Codigo
