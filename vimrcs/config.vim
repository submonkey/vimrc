set timeout timeoutlen=300 ttimeoutlen=10

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

set complete=.,w,b,u,t
set completeopt=longest,menuone,preview

" LaTex Files
set wildignore=*.aux,*.lof,*.log,*.lot,*.out
" Images Files
set wildignore+=*.png,*.jpg,*.gif
" Others
set wildignore+=*.pdf

" Formatting
set nowrap
set textwidth=0
set shiftwidth=2
set tabstop=2
set expandtab
set smarttab

set autoindent
set cindent

" Visual
syntax enable

set relativenumber
set mouse=a
set mousehide

set showmatch
set matchtime=2

set wildmenu
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
  set gfn=Menlo\ for\ Powerline:h13
  set guioptions-=T
  set guioptions-=e
  set guioptions-=r
  set guioptions-=R
  set guioptions-=l
  set guioptions-=L
endif

highlight ColorColumn ctermbg=red
call matchadd('ColorColumn', '\%81v', 100)
