nodeswitchAPPDATA=$(cygpath -u $APPDATA)

if [ "$3" != "" ]; then
    echo "Incorrect command"
else
    if [ "$1" = "use" ] && [ "$2" != "" ]; then
        if [ "$2" = "default" ]; then
            if [ ! -z "$nodeswitchDefaultPATH" ]; then
                export PATH=$nodeswitchDefaultPATH
            fi
        else
            if [ -d "$nodeswitchAPPDATA/nodeswitch/$2" ]; then
                if [ -z "$nodeswitchDefaultPATH" ]; then
                    export nodeswitchDefaultPATH=$PATH
                    export PATH=$nodeswitchAPPDATA/nodeswitch/$2:$nodeswitchAPPDATA/nodeswitch/$2/globalPrefix:$PATH
                else
                    export PATH=$nodeswitchAPPDATA/nodeswitch/$2:$nodeswitchAPPDATA/nodeswitch/$2/globalPrefix:$nodeswitchDefaultPATH
                fi
            else
                echo "Node version not installed"
            fi
        fi
    else
        "$(dirname ${BASH_SOURCE[0]})/nodeswitch.cmd" "$@"
    fi
fi
