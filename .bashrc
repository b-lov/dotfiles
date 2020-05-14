#!/usr/bin/env bash

# source aliases
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# prompt
export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 13)\]\W\[$(tput setaf 1)\]] \[$(tput sgr0)\]"

# cd without cd
shopt -s autocd

# infinite history
HISTSIZE= HISTFILESIZE=

# {{{ fuzzy stuff 

export FZF_DEFAULT_COMMAND="fd --type file\
  --follow\
  --hidden\
  --exclude .git\
  --exclude .wine\
  --exclude .nvm\
  --exclude .npm\
  --exclude .cache\
  --exclude node_modules\
  --exclude dist\
  --color=always"

export FZF_DEFAULT_OPTS="--ansi --no-height"

export FZF_CTRL_T_COMMAND="fd --type file\
  --follow\
  --hidden\
  --exclude .git\
  --exclude .wine\
  --exclude .nvm\
  --exclude .npm\
  --color=always"

export FZF_CTRL_T_OPTS="--preview-window right:70%\
  --preview 'bat --style=header --color=always {}'"

export FZF_ALT_C_COMMAND="fd --type directory\
  --follow\
  --hidden\
  --exclude .git\
  --exclude .wine\
  --exclude .nvm\
  --exclude .npm\
  --color=always"

export FZF_ALT_C_OPTS="--preview-window right:70%\
  --preview 'tree -C {} | head -200'"

export FZF_CTRL_R_OPTS="--preview 'echo {}'\
  --preview-window down:3:hidden:wrap\
  --bind '?:toggle-preview'"

_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" --exclude ".wine" . "$1"
}

_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" --exclude ".wine" . "$1"
}
# }}}

# z directory jumping
. /usr/share/z/z.sh

# node stuff, makes terminal slow
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
