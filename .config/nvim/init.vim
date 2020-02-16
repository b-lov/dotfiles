" PLUGINS

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
Plug 'lifepillar/vim-solarized8'
Plug 'itchyny/lightline.vim'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'lyokha/vim-xkbswitch'
Plug 'chrisbra/Colorizer'
Plug 'morhetz/gruvbox'
Plug '~/.fzf'
call plug#end()

" APPEARANCE

" colorscheme
autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
set termguicolors
set background=dark
let g:gruvbox_italic=1
colorscheme gruvbox

" enable syntax
syntax enable

" different cursor shape in normal and insert mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" indicate folds next to line numbers
set foldcolumn=2

" show numbers+relativenumbers
set number relativenumber

" always display statusline
set showtabline=2
set laststatus=2
set noshowmode

" lightline settings
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' },
      \ 'component': { 'lineinfo': ' %3l:%-2v' },
      \ }

" limelight
let g:limelight_conceal_guifg = '#32484f'

" tabs and spaces...
set tabstop=4       " The width of a TAB is set to 4.
set shiftwidth=4    " Indents will have a width of 4
set softtabstop=4   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces

" BASICS

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

" MAPPINGS

" set space as leader
let mapleader = "\<Space>"
nnoremap <silent> <leader>yo :Goyo <bar> highlight StatusLineNC ctermfg=white <bar> hi FoldColumn none <CR>
nnoremap <silent> <leader>ll :Limelight!! <CR>
nnoremap <silent> <leader>ww :w <CR>
nnoremap <silent> <leader>q :q <CR>
nnoremap <silent> <leader>wq :wq <CR>
nnoremap <silent> <leader>f :FZF<cr>
nnoremap <silent> <leader>F :FZF ~<cr>

" save protected file with w!! when not opened with sudo
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
