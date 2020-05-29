" {{{ basics
set termguicolors " apparently needed

syntax enable " enable syntax

set foldcolumn=1 " indicate folds next to line numbers

set number relativenumber " show numbers+relativenumbers

" always display statusline
set showtabline=2
set laststatus=2
set noshowmode

" tabs and spaces
set expandtab     " Expand TABs to spaces
set tabstop=2     " The width of a TAB is set to 2.
set shiftwidth=2  " Indents will have a width of 2
set softtabstop=2 " Sets the number of columns for a TAB
set smarttab

set cursorline " show cursorline

set linebreak " wrap lines on whole words

set incsearch " start searching immediatly
set ignorecase
set smartcase

set timeoutlen=500 ttimeoutlen=0 " eliminate esc delay

set spelllang=ru_yo,de_de,en_us " spelling

" allow non-capital sentence start
set spellcapcheck=

" natural splitting
set splitbelow
set splitright

" show lines below/above cursor
set scrolloff=3

" start all terminal windows in insert mode
autocmd TermOpen,BufWinEnter,BufEnter term://* startinsert

" folds
set foldmethod=marker

" hide buffers instead of closing
set hidden

" fix hot reloading on save
set backupcopy=yes
" }}}

" {{{ basic mappings
let mapleader = "\<Space>"

nnoremap ! :edit <CR>
nnoremap <leader>n :tabnew <CR>
nnoremap <leader>w :w <CR>
nnoremap <leader>W :wq <CR>
nnoremap <leader>z :bd <CR>
nnoremap <leader>q :q <CR>
nnoremap <leader>T :tabnew term://bash <CR>
nnoremap <leader>t :new term://bash <bar> res 7 <CR>
nnoremap <c-w>v :vnew<CR>
" nnoremap j gj
" nnoremap k gk
nnoremap <F4> :set invwrap wrap?<CR>

" switch to normal inside terminal
tnoremap <M-q> <c-\><c-n>

" {{{ window navigation
" Terminal mode
tnoremap <M-h> <c-\><c-n><c-w>h
tnoremap <M-j> <c-\><c-n><c-w>j
tnoremap <M-k> <c-\><c-n><c-w>k
tnoremap <M-l> <c-\><c-n><c-w>l
" Insert mode:
inoremap <M-h> <Esc><c-w>h
inoremap <M-j> <Esc><c-w>j
inoremap <M-k> <Esc><c-w>k
inoremap <M-l> <Esc><c-w>l
" Visual mode:
vnoremap <M-h> <Esc><c-w>h
vnoremap <M-j> <Esc><c-w>j
vnoremap <M-k> <Esc><c-w>k
vnoremap <M-l> <Esc><c-w>l
" Normal mode:
nnoremap <M-h> <c-w>h
nnoremap <M-j> <c-w>j
nnoremap <M-k> <c-w>k
nnoremap <M-l> <c-w>l
" }}}

" tab navigation
nnoremap H gT
nnoremap L gt

" save protected file with w!!
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" reload vim config
nnoremap <leader>% :source ~/.config/nvim/init.vim<cr>

" replace selected text
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" move selected lines up and down
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv
" }}}

" {{{ plugins 
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
  \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-dispatch'
Plug 'takac/vim-hardtime'
Plug 'mlaursen/vim-react-snippets'
Plug 'voldikss/vim-floaterm'
Plug 'liuchengxu/vim-which-key'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-startify'
Plug 'itchyny/lightline.vim'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'lyokha/vim-xkbswitch'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'Yggdroot/indentLine'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'tpope/vim-commentary'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'honza/vim-snippets'
Plug 'romainl/vim-cool'
Plug 'tpope/vim-surround'
Plug 'arcticicestudio/nord-vim'
Plug 'psliwka/vim-smoothie'
Plug 'Shougo/echodoc'
Plug 'ryanoasis/vim-devicons'
call plug#end()
" }}}

" {{{ plugin settings

" vim-fugitive
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>gt :Gcommit -v -q %:p<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR><CR>
nnoremap <leader>gl :silent! Glog<CR>:bot copen<CR>
" nnoremap <leader>gp :Ggrep<Space>
nnoremap <leader>gm :Gmove<Space>
nnoremap <leader>gb :Git branch<Space>
nnoremap <leader>go :Git checkout<Space>
nnoremap <leader>gps :Dispatch! git push<CR>
nnoremap <leader>gpl :Dispatch! git pull<CR>

" hardtime
let g:hardtime_default_on = 1
" let g:hardtime_allow_different_key = 1

" floaterm
let g:floaterm_keymap_new    = '<F9>'
let g:floaterm_keymap_prev   = '<F10>'
let g:floaterm_keymap_next   = '<F11>'
let g:floaterm_keymap_toggle = '<F12>'
let g:floaterm_width = 0.9
let g:floaterm_height = 0.7

" startify
autocmd User Startified setlocal buflisted

" which-key
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
let g:which_key_use_floating_win = 1

" vim-polyglot
let g:vim_jsx_pretty_colorful_config = 1 " jsx-pretty

" echodoc
let g:echodoc#enable_at_startup = 1
" let g:echodoc#type = 'virtual'

" nord colorscheme
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1
let g:nord_cursor_line_number_background = 1
colorscheme nord

" markdown-preview
function! g:Open_browser(url)
  silent exe "! brave --new-window " . a:url . "&"
endfunction
let g:mkdp_browserfunc = 'g:Open_browser'
let g:mkdp_auto_close = 0
autocmd FileType markdown nmap <leader>m :MarkdownPreview<CR>

" indentline
let g:indentLine_char = '│'
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_leadingSpaceEnabled = 1
autocmd BufEnter NERD_tree* :LeadingSpaceDisable " disable in nerdtree
autocmd TermOpen *#FZF* :IndentLinesDisable " disable in fzf

" enable vim-xkbswitch plugin for russian typing
let g:XkbSwitchEnabled = 1

" goyo
nnoremap <leader>yo :Goyo <CR>

" limelight
nnoremap <leader>ll :Limelight!! <CR>

" vim-commentary
nmap ö gc
vmap ö gc

" nvim-colorizer
lua require'colorizer'.setup()

" {{{ lightline
let g:lightline = {
  \ 'colorscheme': 'nord',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'tabline': { 'left': [['tabs']], 'right': [['']] }, 
  \ 'separator': { 'left': '', 'right': '' },
  \ 'subseparator': { 'left': '', 'right': '' },
  \ 'component': { 'lineinfo': '%3l:%-2v' },
  \ 'component_function': { 'filetype': 'MyFiletype', 'fileformat': 'MyFileformat', 'cocstatus': 'coc#status' },
  \ }

" functions to show devicons in tabline
function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

" update lightline on coc refresh
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
" }}}

" {{{ fzf
let $FZF_PREVIEW_COMMAND = 'bat --style=header --color=always {}'
let $FZF_DEFAULT_OPTS="--reverse --ansi"
let g:fzf_preview_window = 'right:70%'

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.7 } }

nnoremap <leader>f :Files<cr>
nnoremap <leader>F :Files ~<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>c :Commands<cr>
nnoremap <leader>hi :History:<cr>
nnoremap <leader>H :Help<cr>
" }}}

" {{{ COC
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>o  <Plug>(coc-format-selected)
nmap <leader>o  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>af  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Mappings using CoCList:
" show all lists
nnoremap <silent> <c-s>l  :<C-u>CocList<cr>
" Show all diagnostics.
nnoremap <silent> <c-s>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <c-s>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <c-s>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <c-s>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <c-s>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <c-s>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <c-s>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <c-s>p  :<C-u>CocListResume<CR>

" command for prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" autoindent on opening bracket + enter
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" }}}

" disable auto-commenting new lines
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" }}}
