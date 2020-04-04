" {{{ plugins 
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
  \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'lyokha/vim-xkbswitch'
Plug 'chrisbra/Colorizer'
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'Yggdroot/indentLine'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'tpope/vim-commentary'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'honza/vim-snippets'
Plug 'romainl/vim-cool'
Plug 'tpope/vim-surround'
Plug 'ryanoasis/vim-devicons'
call plug#end()
" }}}

" {{{ appearance
" colorscheme
" autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
set termguicolors
set background=dark
let g:gruvbox_italic=1
colorscheme gruvbox

syntax enable " enable syntax

" different cursor shape in normal and insert mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

set foldcolumn=1 " indicate folds next to line numbers

set number relativenumber
" show numbers+relativenumbers

" always display statusline
set showtabline=2
set laststatus=2
set noshowmode

" lightline settings
let g:lightline = {
  \ 'colorscheme': 'gruvbox',
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

" tabs and spaces...
set expandtab       " Expand TABs to spaces
set tabstop=2       " The width of a TAB is set to 2.
set shiftwidth=2    " Indents will have a width of 2
set softtabstop=2   " Sets the number of columns for a TAB
set smarttab

" disable auto-commenting new lines
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" custom function for markdown preview to open brave in new window
function! g:Open_browser(url)
  silent exe "! brave --new-window " . a:url . "&"
endfunction
let g:mkdp_browserfunc = 'g:Open_browser'
let g:mkdp_auto_close = 0

" indentline leading spaces
let g:indentLine_char = '│'
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_leadingSpaceEnabled = 1
autocmd BufEnter NERD_tree* :LeadingSpaceDisable " disable in nerdtree
autocmd TermOpen *#FZF* :IndentLinesDisable " disable in terminal windows

" start nerdtree minimal
let NERDTreeMinimalUI=1

" show cursorline
set cursorline
" }}}

" {{{ basics
set linebreak " wrap lines on whole words

" start searching immediatly
set incsearch
set ignorecase
set smartcase

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

" natural splitting
set splitbelow
set splitright

" show lines below/above cursor
set scrolloff=3

" start all terminal windows in insert mode
autocmd TermOpen,BufWinEnter,BufEnter term://* startinsert

" folds
set foldmethod=marker

" hide buffers instead of closing them
set hidden

" fix hot reloading on save
set backupcopy=yes
" }}}

" {{{ mappings
" set space as leader
let mapleader = "\<Space>"
" various normal mode mappings
nnoremap ! :edit <CR>
nnoremap <leader>yo :Goyo <CR>
nnoremap <leader>ll :Limelight!! <CR>
nnoremap <leader>w :w <CR>
nnoremap <leader>z :bd <CR>
nnoremap <leader>q :q <CR>
nnoremap <leader>t :term<cr>
nnoremap <leader>T :tabnew term://bash<cr>
nnoremap <leader>n :NERDTreeToggle<cr>
nnoremap <c-w>v :vnew<CR>
nnoremap j gj
nnoremap k gk
nnoremap <F4> :set invwrap wrap?<CR>

" switch windows
" Terminal mode
tnoremap <M-q> <c-\><c-n>
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

" map for markdown preview for markdown files 
autocmd FileType markdown nmap <leader>m :MarkdownPreview<CR>

" save protected file with w!! when not opened with sudo
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" reload vim config
nnoremap <leader>% :source ~/.config/nvim/init.vim<cr>

" tab navigation
nnoremap H gT
nnoremap L gt
nmap ö gc
" }}}

" {{{ coc
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
" nmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Mappings using CoCList:
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

" {{{ fuzzy
let $FZF_PREVIEW_COMMAND = 'bat --style=header --color=always {}'
let $FZF_DEFAULT_OPTS="--reverse --ansi"
let g:fzf_preview_window = 'right:70%'

function! CreateCenteredFloatingWindow()
    let width = min([&columns - 4, max([80, &columns - 20])])
    let height = min([&lines - 4, max([20, &lines - 10])])
    let top = ((&lines - height) / 2) - 1
    let left = (&columns - width) / 2
    let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

    let top = "╭" . repeat("─", width - 2) . "╮"
    let mid = "│" . repeat(" ", width - 2) . "│"
    let bot = "╰" . repeat("─", width - 2) . "╯"
    let lines = [top] + repeat([mid], height - 2) + [bot]
    let s:buf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
    call nvim_open_win(s:buf, v:true, opts)
    set winhl=Normal:Floating
    let opts.row += 1
    let opts.height -= 2
    let opts.col += 2
    let opts.width -= 4
    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    au BufWipeout <buffer> exe 'bw '.s:buf
endfunction

" let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.7 } }
let g:fzf_layout = { 'window': 'call CreateCenteredFloatingWindow()' }

nnoremap <leader>f :Files<cr>
nnoremap <leader>F :Files ~<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>c :Commands<cr>
nnoremap <leader>h :History:<cr>
nnoremap <leader>H :Help<cr>
" }}}
