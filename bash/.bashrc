#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

HISTCONTROL=ignoreboth

shopt -s histappend

HISTSIZE=1000
HISTFILESIZE=2000

shopt -s checkwinsize

alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
#alias start='sudo systemctl start'
#alias stop='sudo systemctl stop'
#alias restart='sudo systemctl restart'
#alias status='sudo systemctl status'

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

RED="$(tput setaf 1)"
BOLD="$(tput bold)"
WHITE="$(tput setaf 7)"
BLUE="$(tput setaf 4)"
CYAN="$(tput setaf 6)"
RESET="$(tput sgr0)"

PS1='[\[${RED}\]\u\[${BOLD}${WHITE}\]@\[${RESET}${BLUE}\]\h \[${CYAN}\]\w\[${RESET}\]]\$ '
