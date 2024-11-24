# Use aliases

## .bashrc aliases

```bash
alias sudo='sudo '

alias cls='clear'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'


# Computer
#------------
alias network-adapter-restart='sudo systemctl restart NetworkManager'
alias network-listen="sudo ss -ltpn"
alias ip-listen="sudo ss -ltp"

alias os-ver_bios='sudo dmidecode --type bios'
alias os-services-user='systemctl --user list-units --type=service'
alias ps='ps -aux'


alias watchCli='watch -n1 -x' 

# Other windows
alias isFolderCRLF='find . -not -type d -exec file "{}" ";" | grep CRLF'
alias isFileCRLF='cat -A'

# Sqlite - sudo apt install sqlite3; sudo apt install sqlitebrowser
#----------
alias sqlite='sqlitebrowser'
```
