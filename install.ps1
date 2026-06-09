if ([Environment]::OSVersion.Platform -ne "Win32NT" -or $env:PROCESSOR_ARCHITECTURE -ne "AMD64") {
    Write-Host "This utility is only for Microsoft Windows x64"
    exit 1
}

Invoke-RestMethod -Uri "https://github.com/alexsch01/nodeswitch-windows/raw/refs/heads/main/bin/nodeswitch" -OutFile "C:\scripts\nodeswitch"
Invoke-RestMethod -Uri "https://github.com/alexsch01/nodeswitch-windows/raw/refs/heads/main/bin/nodeswitch.cmd" -OutFile "C:\scripts\nodeswitch.cmd"
Invoke-RestMethod -Uri "https://github.com/alexsch01/nodeswitch-windows/raw/refs/heads/main/bin/nodeswitch.ps1" -OutFile "C:\scripts\nodeswitch.ps1"
Invoke-RestMethod -Uri "https://github.com/alexsch01/nodeswitch-windows/raw/refs/heads/main/bin/nodeswitch.sh" -OutFile "C:\scripts\nodeswitch.sh"

# copy .\bin\nodeswitch %AppData%\npm
# copy .\bin\nodeswitch.cmd %AppData%\npm
# copy .\bin\nodeswitch.ps1 %AppData%\npm
# copy .\bin\nodeswitch.sh %AppData%\npm
# findstr /m "alias nodeswitch=" %userprofile%\.bash_profile > nul
# if %errorlevel% == 1 ( echo alias nodeswitch="source nodeswitch" >> %userprofile%\.bash_profile )
# if not exist %AppData%\nodeswitch ( mkdir %AppData%\nodeswitch )
