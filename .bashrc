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

# fuzzy stuff
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git --exclude .wine --color=always'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type directory --follow --hidden --exclude .git --exclude .wine --color=always'
export FZF_DEFAULT_OPTS="--ansi --height 80% --preview-window right:70% --preview 'bat --style=header --color=always {}'"
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" --exclude ".wine" . "$1"
}
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" --exclude ".wine" . "$1"
}
