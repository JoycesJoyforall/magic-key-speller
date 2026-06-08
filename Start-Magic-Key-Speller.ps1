$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$ports = 8787..8799

function Test-PortFree {
  param([int]$Port)
  $listener = [System.Net.Sockets.TcpListener]::new([System.Net.IPAddress]::Parse("127.0.0.1"), $Port)
  try {
    $listener.Start()
    return $true
  } catch {
    return $false
  } finally {
    $listener.Stop()
  }
}

$port = $ports | Where-Object { Test-PortFree $_ } | Select-Object -First 1
if (-not $port) {
  Write-Host "No local port is free. Please close an older Magic Key Speller window and try again."
  Pause
  exit 1
}

$pythonCommand = $null
if (Get-Command py -ErrorAction SilentlyContinue) {
  $pythonCommand = @{ FilePath = "py"; Args = @("-3", "-m", "http.server", "$port", "--bind", "127.0.0.1") }
} elseif (Get-Command python -ErrorAction SilentlyContinue) {
  $pythonCommand = @{ FilePath = "python"; Args = @("-m", "http.server", "$port", "--bind", "127.0.0.1") }
} else {
  Write-Host "Python was not found. Please install Python, then run this file again."
  Pause
  exit 1
}

Start-Process -FilePath $pythonCommand.FilePath -ArgumentList $pythonCommand.Args -WorkingDirectory $root -WindowStyle Hidden
Start-Sleep -Milliseconds 900

$url = "http://127.0.0.1:$port/index.html"
if (Get-Command msedge -ErrorAction SilentlyContinue) {
  Start-Process -FilePath "msedge" -ArgumentList $url
} else {
  Start-Process $url
}

Write-Host ""
Write-Host "Magic Key Speller is running at $url"
Write-Host "In Edge, choose the install/app icon in the address bar, or use Settings > Apps > Install this site as an app."
Write-Host ""
Write-Host "You can close this window."
Pause
