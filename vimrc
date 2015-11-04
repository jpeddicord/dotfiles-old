set nocompatible

" windows path bootstrap
if has('win32') || has('win64')
	set runtimepath=$HOME/.vim,$VIMRUNTIME,$HOME/.vim/after
endif

" restore runtimepath under sudo
let s:origvim=expand("<sfile>:p:h").'/.vim'
let &runtimepath=printf('%s,%s,%s/after', s:origvim, &runtimepath, s:origvim)

" pathogen
runtime pathogen/autoload/pathogen.vim
execute pathogen#infect()

" editing options
filetype plugin indent on
set shiftwidth=4
set expandtab
set smarttab
set backspace=indent,eol,start
set textwidth=0
set timeoutlen=600
" indentation settings
set autoindent
set copyindent
set cinoptions=:0,l1,b1,g0,i0,(1s,U1,Ws,m1,j1,J1
set cinkeys+=0=break
" search and display
set showmatch
set hlsearch
set incsearch
set showcmd
set cursorline
" windowing
set hidden
set number
set scrolloff=3
set ruler
set title
set laststatus=2
" misc
set encoding=utf-8
set directory=~/.vim/swap,.,/var/tmp,/tmp
set nobackup
set noerrorbells
set novisualbell
set mouse=a
set sessionoptions=buffers,curdir,folds,tabpages,winsize
set shortmess+=I
set ttymouse=xterm2

" color scheme
syntax on
set t_Co=16
set background=dark
colorscheme solarized

" show trailing whitespace (except insert mode)
highlight ExtraWhitespace ctermbg=red guibg=red
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/

" set <Leader> to comma
let mapleader=','

" window movement mappings
noremap <C-h> <C-w>h
inoremap <C-h> <C-o><C-w>h
noremap <C-j> <C-w>j
inoremap <C-j> <C-o><C-w>j
noremap <C-k> <C-w>k
inoremap <C-k> <C-o><C-w>k
noremap <C-l> <C-w>l
inoremap <C-l> <C-o><C-w>l
nnoremap <S-h> :tabprevious<CR>
nnoremap <S-l> :tabnext<CR>
nnoremap <S-j> :bnext<CR>
nnoremap <S-k> :bprevious<CR>

" custom leader commands
nnoremap <Leader>c :bdelete<CR>
nnoremap <Leader>C :bdelete!<CR>
nnoremap <Leader>e :enew<CR>
nnoremap <Leader>d :cd %:p:h<CR>:pwd<CR>
nnoremap <Leader>p :set paste!<CR>:set paste?<CR>
nnoremap <Leader>/ :nohlsearch<CR>

" vertical movements by screen line
nnoremap j gj
nnoremap k gk

" accidential aliases
cnoreabbrev W w
cnoreabbrev Q q


" airline statusline
let g:airline_left_sep = ""
let g:airline_right_sep = ""
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" indenthtml settings
let g:html_indent_inctags = 'html,body,head,tbody'
let g:html_indent_script1 = 'inc'
let g:html_indent_style1 = 'inc'

" gundo plugin
let g:gundo_preview_bottom=1
nmap <Leader>u :GundoToggle<CR>

" Solarized
call togglebg#map('<Leader>b')

