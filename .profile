#!/usr/bin/env sh

# environment variables
export PATH="$PATH:$HOME/.local/bin"
export EDITOR="nvim"
export TERMINAL="st-256color"
export BROWSER="brave"
export READER="zathura"
export FILE="ranger"

# cs50 stuff
export CC="clang"
export CFLAGS="-fsanitize=signed-integer-overflow -fsanitize=undefined -ggdb3 -O0 -std=c11 -Wall -Werror -Wextra -Wno-sign-compare -Wno-unused-parameter -Wno-unused-variable -Wshadow"
export LDLIBS="-lcrypt -lcs50 -lm"

# load bashrc
[[ -f ~/.bashrc ]] && . ~/.bashrc

# start x-server if on tty1 and bspwm not running
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x bsmwp >/dev/null && exec startx
