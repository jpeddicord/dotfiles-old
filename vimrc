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

" autocompletion
set omnifunc=syntaxcomplete#Complete
set completeopt+=menuone,menu,longest,preview
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --languages=C,C++ .<CR>
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

