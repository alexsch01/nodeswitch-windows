$nodeswitch1stParameter = $args[0]
$nodeswitch2ndParameter = $args[1]

if ( $args[2] -ne $null ) {
    echo "Incorrect command"
} else {
    if ( $nodeswitch1stParameter -eq "use" -and $nodeswitch2ndParameter -ne $null ) {
        if ( $nodeswitch2ndParameter -eq "default" ) {
            if ( $global:nodeswitchDefaultPATH -ne $null ) {
                $env:Path = $global:nodeswitchDefaultPATH
            }
        } else {
            if ( Test-Path -Path $env:AppData\nodeswitch\$nodeswitch2ndParameter ) {
                if ( $global:nodeswitchDefaultPATH -eq $null ) {
                    $global:nodeswitchDefaultPATH = $env:Path
                    $env:Path = "$env:AppData\nodeswitch\$nodeswitch2ndParameter;$env:AppData\nodeswitch\$nodeswitch2ndParameter\globalPrefix;$env:Path"
                } else {
                    $env:Path = "$env:AppData\nodeswitch\$nodeswitch2ndParameter;$env:AppData\nodeswitch\$nodeswitch2ndParameter\globalPrefix;$global:nodeswitchDefaultPATH"
                }
            } else {
                echo "Node version not installed"
            }
        }
    } else {
        & "$PSScriptRoot\nodeswitch.cmd" @args
    }
}
