execute pathogen#infect()

" Space as a Leader
let mapleader=" "
" Use Vim features, not Vi
set nocompatible
" Use UTF-8 by default
set encoding=utf-8
set fileencoding=utf-8

syntax enable
set background=dark

" Set relative line numbers...
set relativenumber
" ...but absolute numbers on the current line (hybrid numbering)
set number

" `jj` and `jk` to throw you into normal mode from insert mode
inoremap jj <Esc>
inoremap jk <Esc>

" Highlight current line
set cursorline
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch

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

set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set autoindent

set showmatch
set mat=2
