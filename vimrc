"====================
" PLUGINS
"====================

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    augroup InstallVimPlug
        autocmd!
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    augroup END
endif

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-abolish'
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim', { 'for': ['html', 'html.twig', 'blade'] }
Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'
Plug 'Olical/vim-enmasse'
Plug 'chrisbra/Colorizer'
Plug 'connorholyday/vim-snazzy'
Plug 'SirVer/ultisnips'
Plug 'mhinz/vim-signify'
Plug 'arnaud-lb/vim-php-namespace', { 'for': 'php' }
Plug 'janko-m/vim-test'

call plug#end()

if executable('rg')
    set grepprg=rg\ --vimgrep
endif

augroup AutoOpenQuickfix
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost l*    lwindow
augroup END

set runtimepath+=~/.vim/UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']

"====================
" SETUP
"====================

filetype plugin indent on
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
set showcmd
set path+=**
set wildmenu
set scrolloff=5
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

let g:SnazzyTransparent = 1
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

set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent

"====================
" STATUSLINE
"====================

set laststatus=2
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

function! IPhpInsertUse() abort
    call PhpInsertUse()
    call feedkeys('a', 'n')
endfunction

augroup PhpInsertUse
    autocmd!
    autocmd FileType php nnoremap <Leader>u :call PhpInsertUse()<CR>
augroup END

"====================
" TESTS
"====================

nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>
