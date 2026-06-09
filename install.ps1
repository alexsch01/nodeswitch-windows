if ([Environment]::OSVersion.Platform -ne "Win32NT" -or $env:PROCESSOR_ARCHITECTURE -eq "x86") {
    Write-Host "This npm module is only for Microsoft Windows x64"
    exit 1
}

echo 'hi'
