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
Plug 'Olical/vim-enmasse'
Plug 'chrisbra/Colorizer'
Plug 'mhinz/vim-signify'
Plug 'janko-m/vim-test'
Plug 'itchyny/lightline.vim'

" languages
Plug 'sheerun/vim-polyglot'
Plug 'SirVer/ultisnips'
Plug 'arnaud-lb/vim-php-namespace', { 'for': 'php' }

" linting
Plug 'w0rp/ale'
Plug 'editorconfig/editorconfig-vim'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue'] }

" fzf
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" colorschemes
Plug 'connorholyday/vim-snazzy'
Plug 'NLKNguyen/papercolor-theme'

call plug#end()

if executable('rg')
    set grepprg=rg\ --vimgrep
endif

set runtimepath+=~/.vim/UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']

let g:lightline = {
                \ 'colorscheme': 'snazzy',
                \ }

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
set scrolloff=5
set sidescrolloff=5
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000
set path+=**
set wildmenu
set wildignore+=*/node_modules/*
set wildignore+=*/bower_components/*
set wildignore+=.git

"====================
" COLORSCHEME
"====================

syntax enable

if empty($VIMCOLOR)
    let $VIMCOLOR = "snazzy"
elseif $VIMCOLOR == "PaperColor" && empty($VIMBG)
    let $VIMBG = "light"
endif

if empty($VIMBG)
    let $VIMBG = "dark"
endif

execute "set background=".$VIMBG
execute "colorscheme ".$VIMCOLOR

"====================
" REMAPS
"====================

function! ColorSwitch()
    let &background = (&background == "dark" ? "light" : "dark")
    let $VIMCOLOR = (&background == "dark" ? "snazzy" : "PaperColor")
    color $VIMCOLOR
endfunction

nnoremap <silent> <Leader>bg :call ColorSwitch()<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <BS> <C-^>

if executable('fzf')
    nnoremap <C-p> :Files<CR>
endif

if has('nvim')
    if exists(':tnoremap')
        tnoremap <C-h> <C-\><C-n><C-w><C-h>
        tnoremap <C-j> <C-\><C-n><C-w><C-j>
        tnoremap <C-k> <C-\><C-n><C-w><C-k>
        tnoremap <C-l> <C-\><C-n><C-w><C-l>

        augroup TerminalDefaultInsert
            autocmd!
            autocmd TermOpen * setlocal nonumber norelativenumber
            autocmd TermOpen * startinsert
            autocmd BufWinEnter,WinEnter term://* startinsert
            autocmd BufLeave term://* stopinsert
        augroup END

    endif
endif

"====================
" SEARCHING
"====================

set cursorline
set hlsearch
set ignorecase
set incsearch

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
	\ '' : 'V·Block',
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
            \   'javascript': ['flow', 'eslint']
            \}

let g:ale_fixers = {
            \   'javascript': ['prettier']
            \}
let g:ale_fix_on_save = 1

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
