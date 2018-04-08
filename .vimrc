execute pathogen#infect()

"====================
" SETUP
"====================

" Space as a Leader
let mapleader = "\<Space>"
" Use Vim features, not Vi
set nocompatible
" Use UTF-8 by default
set encoding=utf-8
set fileencoding=utf-8
filetype plugin indent on
" More natural split locations
set splitbelow
set splitright

" Remove backup files
set nobackup
set nowritebackup
set noswapfile

"====================
" THEME
"====================

syntax enable
set background=dark

" Always show status line
set laststatus=2
" Show the cursor position
set ruler
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Enable fuzzy find
set path+=**
" Show tab completion menu
set wildmenu
" Start scrolling before reaching the bottom
set scrolloff=1
set sidescrolloff=5

" Allow color schemes to do bright colors without forcing bold
if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
  set t_Co=16
endif

"====================
" NUMBERING
"====================

" Set relative line numbers...
set relativenumber
" ...but absolute numbers on the current line (hybrid numbering)
set number
" Numbers that lead with 0 are decimal not octal
set nrformats-=octal

"====================
" REMAPS
"====================

" `jj` and `jk` to throw you into normal mode from insert mode
inoremap jj <Esc>
inoremap jk <Esc>

"====================
" SEARCHING
"====================

" Highlight current line
set cursorline
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" This unsets the 'last search pattern' register by hitting return
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
