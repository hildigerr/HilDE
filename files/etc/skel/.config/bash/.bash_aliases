#
#  my aliases
#

# Enforce XDG Base Directory Specification Compliance
alias wget='wget --hsts-file="${XDG_STATE_HOME:-$HOME/.local/state}/wget-hsts"'

# enable color support of ls and grep
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

#  Searching
alias lss='ls | grep'
alias hgrep='history | grep'

#  Networking
alias myip-lan="ip -4 a|grep -oP '(?<=inet\s)\d+(\.\d+){3}'|grep -v '127.0.0.1'"
alias myip-wan="curl ifconfig.me/ip"
