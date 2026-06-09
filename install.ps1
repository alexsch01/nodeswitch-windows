if ([Environment]::OSVersion.Platform -ne "Win32NT" -or $env:PROCESSOR_ARCHITECTURE -ne "AMD64") {
    Write-Host "This utility is only for Microsoft Windows x64"
    exit 1
}

echo 'hi'
