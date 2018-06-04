"====================
" PLUGINS
"====================

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-abolish'
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim', { 'for': ['html', 'html.twig', 'blade'] }
Plug 'w0rp/ale'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'sheerun/vim-polyglot'
Plug 'Olical/vim-enmasse'
Plug 'chrisbra/Colorizer'
Plug 'easymotion/vim-easymotion'
Plug 'connorholyday/vim-snazzy'
Plug 'ludovicchabant/vim-gutentags'
Plug 'SirVer/ultisnips'
Plug 'mhinz/vim-signify'
Plug 'arnaud-lb/vim-php-namespace', { 'for': 'php' }
Plug 'janko-m/vim-test'

filetype plugin indent on
call plug#end()

if executable('rg')
    set grepprg=rg\ --vimgrep
endif

" Open quickfix automatically if it's populated
augroup myvimrc
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost l*    lwindow
augroup END

set runtimepath+=~/.vim/UltiSnips
let g:SnazzyTransparent = 1
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']

"====================
" SETUP
"====================

let mapleader = "\<Space>"
set encoding=utf-8
set fileencoding=utf-8
set splitbelow
set splitright
set clipboard=unnamed
set nobackup
set nowritebackup
set noswapfile
set nrformats-=octal
set title
set showcmd
set path+=**
set wildmenu
set scrolloff=1
set sidescrolloff=5
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000

"====================
" COLORSCHEME
"====================

syntax enable
set background=dark

" Allow color schemes to do bright colors without forcing bold
if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
  set t_Co=16
endif

colorscheme snazzy

"====================
" REMAPS
"====================

inoremap jj <Esc>
inoremap jk <Esc>
nnoremap j gj
nnoremap k gk

" Escape from terminal
tnoremap <ESC> <C-\><C-n>

"====================
" SEARCHING
"====================

set cursorline
set hlsearch
set ignorecase
set incsearch
nnoremap <CR> :noh<CR><CR>

"====================
" INDENTATION
"====================

set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set autoindent
set showmatch
set mat=2

"====================
" STATUSLINE
"====================

" Always show status line
set laststatus=2
" Define all the different modes
let g:currentmode={
	\ 'n'  : 'Normal',
	\ 'no' : 'N·Operator Pending',
	\ 'v'  : 'Visual',
	\ 'V'  : 'V·Line',
	\ '' : 'V·Block',
	\ 's'  : 'Select',
	\ 'S'  : 'S·Line',
	\ '' : 'S·Block',
	\ 'i'  : 'Insert',
	\ 'R'  : 'Replace',
	\ 'Rv' : 'V·Replace',
	\ 'c'  : 'Command',
	\ 'cv' : 'Vim Ex',
	\ 'ce' : 'Ex',
	\ 'r'  : 'Prompt',
	\ 'rm' : 'More',
	\ 'r?' : 'Confirm',
	\ '!'  : 'Shell',
	\ 't'  : 'Terminal',
	\}
set statusline=
set statusline+=%(%{&buflisted?bufnr('%'):''}%)
set statusline+=%(\ %)
set statusline+=[%{toupper(g:currentmode[mode()])}]
set statusline+=%(\ %)
" File path, as typed or relative to current directory
set statusline+=%f%r%m\
set statusline+=%{&modified?'+\ ':''}
set statusline+=%{&readonly?'\ ':''}
" Separation point between left and right aligned items
set statusline+=%=
set statusline+=\ %{&filetype!=#''?&filetype:'none'}
set statusline+=%(\ %{(&bomb\|\|&fileencoding!~#'^$\\\|utf-8'?'\ '.&fileencoding.(&bomb?'-bom':''):'')
  \.(&fileformat!=#(has('win32')?'dos':'unix')?'\ '.&fileformat:'')}%)

"====================
" LINTERS
"====================

let g:ale_linters = {
\  'javascript': ['flow', 'eslint']
\}

"====================
" PHP
"====================

function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>

"====================
" TESTS
"====================

nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>
