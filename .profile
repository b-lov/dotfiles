#!/usr/bin/env sh

# environment variables
export PATH="$PATH:$HOME/.local/bin"
export EDITOR="nvim"
export TERMINAL="st-256color"
export BROWSER="google-chrome"
export READER="zathura"
export FILE="ranger"

# fuzzy stuff
export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git --exclude .wine --color=always'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type directory --follow --hidden --exclude .git --exclude .wine --color=always'
export FZF_DEFAULT_OPTS="--ansi"
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" --exclude ".wine" . "$1"
}
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" --exclude ".wine" . "$1"
}

# load bashrc
[[ -f ~/.bashrc ]] && . ~/.bashrc

# start x-server if on tty1 and i3 not running
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x i3 >/dev/null && exec startx
