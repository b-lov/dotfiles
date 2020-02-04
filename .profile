#!/usr/bin/env sh

export PATH="$PATH:$HOME/.local/bin"
export EDITOR="nvim"
export TERMINAL="st-256color"
export BROWSER="google-chrome"
export READER="zathura"
export FILE="ranger"

# load bashrc
[[ -f ~/.bashrc ]] && . ~/.bashrc

# start x-server if on tty1 and i3 not running
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x i3 >/dev/null && exec startx
