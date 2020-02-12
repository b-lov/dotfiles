#!/usr/bin/env bash

# aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# prompt
export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 13)\]\W\[$(tput setaf 1)\]] \[$(tput sgr0)\]"

# cd without cd
shopt -s autocd

# infinite history
HISTSIZE= HISTFILESIZE=

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
