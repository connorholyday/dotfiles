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
Plug 'mattn/emmet-vim', { 'for': 'html' }
Plug 'airblade/vim-gitgutter'
Plug 'w0rp/ale'
Plug 'scrooloose/nerdtree'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'mileszs/ack.vim'
Plug 'Olical/vim-enmasse'
Plug 'chrisbra/Colorizer'
Plug 'easymotion/vim-easymotion'
Plug 'connorholyday/vim-snazzy'

filetype plugin indent on
call plug#end()

" User Ag where possible
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

"====================
" SETUP
"====================

" Space as a Leader
let mapleader = "\<Space>"
" Use UTF-8 by default
set encoding=utf-8
set fileencoding=utf-8
" More natural split locations
set splitbelow
set splitright
set clipboard=unnamed
" Remove backup files
set nobackup
set nowritebackup
set noswapfile

syntax enable
set background=dark

" Show the cursor position
set ruler
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

set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000

" Allow color schemes to do bright colors without forcing bold
if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
  set t_Co=16
endif

colorscheme snazzy

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

" Escape from terminal
tnoremap <ESC> <C-\><C-n>
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
set statusline+=%f%r%m\  " File path, as typed or relative to current directory
set statusline+=%{&modified?'+\ ':''}
set statusline+=%{&readonly?'\ ':''}
set statusline+=%= " Separation point between left and right aligned items
set statusline+=\ %{&filetype!=#''?&filetype:'none'}
set statusline+=%(\ %{(&bomb\|\|&fileencoding!~#'^$\\\|utf-8'?'\ '.&fileencoding.(&bomb?'-bom':''):'')
  \.(&fileformat!=#(has('win32')?'dos':'unix')?'\ '.&fileformat:'')}%)
set statusline+=\ %{strftime('%H:%M')} " Show time 24hr : minutes

"====================
" FZF
"====================

if executable('fzf')
    nnoremap <leader>f :Files<cr>
    nnoremap <leader>g :GFiles<cr>
    nnoremap <leader>b :Buffers<cr>
end
