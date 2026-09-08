$nodeswitchUseParameter = $args[1]

if ( $args[2] -ne $null ) {
    echo "Incorrect command"
} else {
    if ( $args[0] -eq "use" -and $nodeswitchUseParameter -ne $null ) {
        if ( $nodeswitchUseParameter -eq "default" ) {
            if ( $global:nodeswitchDefaultPATH -ne $null ) {
                $env:Path = $global:nodeswitchDefaultPATH
            }
        } else {
            if ( Test-Path -Path $env:AppData\nodeswitch\$nodeswitchUseParameter ) {
                if ( $global:nodeswitchDefaultPATH -eq $null ) {
                    $global:nodeswitchDefaultPATH = $env:Path
                    $env:Path = "$env:AppData\nodeswitch\$nodeswitchUseParameter;$env:AppData\nodeswitch\$nodeswitchUseParameter\globalPrefix;$env:Path"
                } else {
                    $env:Path = "$env:AppData\nodeswitch\$nodeswitchUseParameter;$env:AppData\nodeswitch\$nodeswitchUseParameter\globalPrefix;$global:nodeswitchDefaultPATH"
                }
            } else {
                echo "Node version not installed"
            }
        }
    } else {
        & "$PSScriptRoot\nodeswitch.cmd" @args
    }
}
