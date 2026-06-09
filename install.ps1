if ([Environment]::OSVersion.Platform -ne "Win32NT" -or $env:PROCESSOR_ARCHITECTURE -ne "AMD64") {
    Write-Host "This utility is only for Microsoft Windows x64"
    exit 1
}

if (-not (Test-Path "$env:AppData\bin")) {
    New-Item -ItemType Directory -Path "$env:AppData\bin" | Out-Null
}

Invoke-RestMethod -Uri "https://github.com/alexsch01/nodeswitch-windows/raw/refs/heads/main/bin/nodeswitch" -OutFile "$env:AppData\bin\nodeswitch"
Invoke-RestMethod -Uri "https://github.com/alexsch01/nodeswitch-windows/raw/refs/heads/main/bin/nodeswitch.cmd" -OutFile "$env:AppData\bin\nodeswitch.cmd"
Invoke-RestMethod -Uri "https://github.com/alexsch01/nodeswitch-windows/raw/refs/heads/main/bin/nodeswitch.ps1" -OutFile "$env:AppData\bin\nodeswitch.ps1"
Invoke-RestMethod -Uri "https://github.com/alexsch01/nodeswitch-windows/raw/refs/heads/main/bin/nodeswitch.sh" -OutFile "$env:AppData\bin\nodeswitch.sh"

$oldPath = [Environment]::GetEnvironmentVariable("Path", "User")
$addPath = "$env:AppData\bin"

if ($oldPath -split [IO.Path]::PathSeparator -notcontains $addPath) {
    $newPath = if ($oldPath) { "$oldPath;$addPath" } else { $addPath }
    [Environment]::SetEnvironmentVariable("Path", $newPath, "User")
}

$bashProfile = "$env:USERPROFILE\.bash_profile"
if (-not (Select-String -Path $bashProfile -Pattern "alias nodeswitch=" -Quiet)) {
    Add-Content -Path $bashProfile -Value 'alias nodeswitch="source nodeswitch"'
}

if (-not (Test-Path "$env:AppData\nodeswitch")) {
    New-Item -ItemType Directory -Path "$env:AppData\nodeswitch" | Out-Null
}
