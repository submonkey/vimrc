set scrolloff=7
set history=256
set clipboard+=unnamed

set autowrite
set nowritebackup
set noswapfile
set hidden

set hlsearch
set ignorecase
set smartcase
set incsearch

set backspace=eol,start,indent
let mapleader=','
let g:mapleader=','

" Formatting
set wrap
set textwidth=0
set shiftwidth=4
set tabstop=4
set expandtab
set smarttab

set autoindent
set cindent

" Visual
syntax on

set relativenumber
set mouse=a
set mousehide

set showmatch
set matchtime=2
set colorcolumn=80

set wildmode=longest,list

set novisualbell
set noerrorbells
set vb t_vb=
set t_Co=256

set laststatus=2
set shortmess=atI
set showcmd

set foldenable
set foldmethod=marker
set foldlevel=100

set foldopen=block,hor,tag
set foldopen+=percent,mark
set foldopen+=quickfix

set virtualedit=block
set splitbelow
set splitright

if has("gui_running")
    set gfn=Menlo\ for\ Powerline:h12
    set guioptions-=T
    set guioptions-=e
    set guioptions-=r
    set guioptions-=R
    set guioptions-=l
    set guioptions-=L
endif
