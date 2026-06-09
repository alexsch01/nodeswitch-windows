# nodeswitch-windows

Node version switcher for Microsoft Windows x64

### How To Install
```
powershell -c "irm https://raw.githubusercontent.com/alexsch01/nodeswitch-windows/main/install.ps1 | iex"
```

You will need to reopen your terminal after it is installed

### Examples
```
nodeswitch add 12.16.3
nodeswitch add 18.13.0

nodeswitch remove 12.16.3
nodeswitch remove 18.13.0

nodeswitch use 12.16.3
nodeswitch use 18.13.0

nodeswitch use default

nodeswitch list
nodeswitch path
```
