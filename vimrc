set nocompatible
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smartindent
set showmatch
set nohlsearch
set incsearch
set number
set nobackup
set noerrorbells
set novisualbell
set mouse=a
set ttymouse=xterm2
set title
set scrolloff=3
filetype on
filetype plugin on
filetype indent on
syntax on

" screen fix
if match($TERM, "screen")!=-1
    set term=xterm
endif

" load packages
call pathogen#runtime_append_all_bundles() 
