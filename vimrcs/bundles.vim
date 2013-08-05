set nocompatible
filetype off

" Setting up Vundle
let vundleStatus=1
let vundleReadme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundleReadme)
    echo "Installing Vundle..."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let vundleStatus=0
endif

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Bundles
Bundle 'gmarik/vundle'
" Autocomplete & snippets
Bundle 'SirVer/ultisnips'
Bundle 'Valloric/YouCompleteMe'
" User Interfaces
Bundle 'sickill/vim-monokai'
Bundle 'bling/vim-airline'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'sjl/gundo.vim'
Bundle 'majutsushi/tagbar'

Bundle 'Lokaltog/vim-easymotion'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimproc.vim'

Bundle 'jcf/vim-latex'
Bundle 'pentie/VimRepress'
Bundle 'ap/vim-css-color'
Bundle 'Townk/vim-autoclose'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'

if vundleStatus == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif

filetype plugin indent on

try
    set background=dark
    colorscheme Monokai
catch
    colorscheme elflord
endtry

" Configturations of mappings
" Vundle Bundle
nnoremap <leader>bi :BundleInstall<cr>
nnoremap <leader>bc :BundleClean<cr>
nnoremap <leader>bu :BundleUpdate<cr>
" Unite Bundle
nnoremap <leader>o :Unite buffer file_rec/async:!<cr>
nnoremap <leader>f :Unite grep:.<cr>
nnoremap <leader>y :Unite history/yank<cr>
nnoremap <leader>nn :Unite file<cr>
" Gundo Bundle
noremap <leader>gg :GundoToggle<cr>
" Tagbar Bundle
nnoremap <leader>tt :TagbarToggle<cr>

" Configurations of bundles
" Unite Bundle
let g:unite_enable_start_insert = 0
let g:unite_winheight = 10 
let g:unite_split_rule = 'botright'
let g:unite_source_history_yank_enable = 1
" Vim Airline Bundle
let g:airline_theme='powerlineish'
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_branch_prefix = '⭠'
let g:airline_readonly_symbol = '⭤'
let g:airline_linecolumn_prefix = '⭡'
" UltiSnips Bundle
let g:UltiSnipsUsePythonVersion = 2
let g:UltiSnipsSnippetDirectories = ['UltiSnips', 'snippets']
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-tab>'
" Vim Latex
if has("mac") || has("macunix")
    let g:Tex_ViewRule_pdf = 'open -a Preview'
elseif has("linux")
    let g:Tex_ViewRule_pdf = 'evince'
endif
let g:Tex_DefaultTargetFormat = 'pdf'
" Vim Indent Guides
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 1
" Gundo Bundle
let g:gundo_width = 40
let g:gundo_preview_height = 20
let g:gundo_preview_bottom = 1
" Tagbar Bundle
let g:tagbar_compact = 1
