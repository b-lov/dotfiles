" ------------------
" PLUGINS
" ------------------
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
Plug 'lifepillar/vim-solarized8'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'lyokha/vim-xkbswitch'
Plug 'chrisbra/Colorizer'
call plug#end()

" ------------------
" APPEARANCE
" ------------------

" colorscheme
set termguicolors
set background=dark
colorscheme solarized8
let g:solarized_termtrans=1

" enable syntax
syntax enable

" different cursor shape in normal and insert mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" indicate folds next to line numbers
set foldcolumn=1

" show numbers+relativenumbers
set number relativenumber

" always display statusline
set showtabline=2
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#xkblayout#enabled = 0

" limelight
let g:limelight_conceal_guifg = '#32484f'

" tabs and spaces...
set tabstop=4       " The width of a TAB is set to 4.
set shiftwidth=4    " Indents will have a width of 4
set softtabstop=4   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces

" ------------------
" BASICS
" ------------------

" wrap lines on whole words
set linebreak

" start searching immediatly
set incsearch

" eliminate esc delay
set timeoutlen=1000 ttimeoutlen=0

" spelling
set spelllang=ru_yo,de_de,en_us

" automatically turn on spelling for .txt files
autocmd BufRead,BufNewFile *.txt setlocal spell

" allow non-capital sentence start
set spellcapcheck=

" enable vim-xkbswitch plugin for russian typing
let g:XkbSwitchEnabled = 1

" ------------------
" MAPPINGS
" ------------------

" set space as leader
let mapleader = "\<Space>"
map <Leader>yo :Goyo <bar> highlight StatusLineNC ctermfg=white <bar> hi FoldColumn none <CR>
map <Leader>ll :Limelight!! <CR>
map <Leader>ww :w <CR>
map <Leader>q :q <CR>
map <Leader>wq :wq <CR>
"nnoremap WW :w <CR>
"nnoremap WQ :wq <CR>
"nnoremap QQ :q <CR>

" save file with w!! when not opened with sudo
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
