#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth:erasedups

HISTIGNORE="w:l[sla]:[bf]g:pwd:clear"

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=5000
HISTFILESIZE=10000

PS1='\u@\h:\w\$ '

# Enforce XDG Base Directory Specification Compliance
export XDG_STATE_HOME="$HOME/.local/state"
export LESSHISTFILE="$XDG_STATE_HOME/less_history"

export GTK2_RC_FILES="${XDG_CONFIG_HOME:-${HOME}/.config}/gtk-2.0/gtkrc"

# Alias definitions.
if [ -f "${XDG_CONFIG_HOME:-${HOME}/.config}/bash/.bash_aliases" ]; then
    . "${XDG_CONFIG_HOME:-${HOME}/.config}/bash/.bash_aliases"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# set MANPATH so it includes user's private manpages if they exist
if [ -d "$HOME/.local/man" ] ; then
    MANPATH="$HOME/.local/man:MANPATH"
fi

