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
Bundle 'tomasr/molokai'
Bundle 'morhetz/gruvbox'
Bundle 'itchyny/lightline.vim'
Bundle 'Yggdroot/indentLine'
Bundle 'sjl/gundo.vim'
Bundle 'majutsushi/tagbar'

Bundle 'Lokaltog/vim-easymotion'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimfiler.vim'
Bundle 'Shougo/vimproc.vim'

Bundle 'jcf/vim-latex'
Bundle 'pentie/VimRepress'
Bundle 'ap/vim-css-color'
Bundle 'Townk/vim-autoclose'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-fugitive'

if vundleStatus == 0
  echo "Installing Bundles, please ignore key map error messages"
  echo ""
  :BundleInstall
endif

filetype plugin indent on

set background=dark
try
  colorscheme gruvbox
catch
  colorscheme slate
endtry

" Configturations of mappings
" Unite Bundle
nnoremap <leader>b :Unite buffer<cr><esc>
nnoremap <leader>f :Unite file_rec/async:!<cr>
nnoremap <leader>y :Unite history/yank<cr>
nnoremap <leader>v :VimFilerExplorer -quit<cr>
" Gundo Bundle
noremap <leader>gg :GundoToggle<cr>
" Tagbar Bundle
nnoremap <leader>tt :TagbarToggle<cr>

" Configurations of bundles
" YouCompleteMe
"let g:ycm_key_list_select_completion = ['j', '<Down>']
"let g:ycm_key_list_previous_completion = ['k', '<Up>']
"let g:ycm_autoclose_preview_window_after_completion = 1
"let g:ycm_autoclose_preview_window_after_insertion = 1
" Unite Bundle
let g:unite_enable_start_insert = 1
let g:unite_winheight = 10 
let g:unite_split_rule = 'botright'
let g:unite_source_history_yank_enable = 1
"let s:file_rec_ignore_pattern = (unite#sources#rec#define()[0]['ignore_pattern']) . '\|\$global\|\.class$\|\<target\>'
"call unite#custom#source('file_rec', 'ignore_pattern', s:file_rec_ignore_pattern)
" UltiSnips Bundle
let g:UltiSnipsUsePythonVersion = 2
let g:UltiSnipsSnippetDirectories = ['UltiSnips', 'snippets']
let g:UltiSnipsExpandTrigger = '<cr>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-tab>'
" Vim Latex
if has("mac") || has("macunix")
  let g:Tex_ViewRule_pdf = 'open -a Preview'
elseif has("linux")
  let g:Tex_ViewRule_pdf = 'evince'
else
  let g:Tex_ViewRule_pdf = 'acrobat'
endif
let g:Tex_DefaultTargetFormat = 'pdf'
" Gundo Bundle
let g:gundo_width = 40
let g:gundo_preview_height = 20
let g:gundo_preview_bottom = 1
" Tagbar Bundle
let g:tagbar_compact = 1

" lightline Bundle
let g:lightline = {
  \ 'colorscheme': 'default',
  \ 'mode_map': { 'c': 'NORMAL' },
  \ 'active': {
  \ 'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
  \ },
  \ 'component_function': {
  \   'modified': 'MyModified',
  \   'readonly': 'MyReadonly',
  \   'fugitive': 'MyFugitive',
  \   'filename': 'MyFilename',
  \   'fileformat': 'MyFileformat',
  \   'filetype': 'MyFiletype',
  \   'fileencoding': 'MyFileencoding',
  \   'mode': 'MyMode',
  \ },
  \ 'separator': { 'left': '', 'right': '' },
  \ 'subseparator': { 'left': '', 'right': '' }
  \ }

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '⭤' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() : 
        \  &ft == 'unite' ? unite#get_status_string() : 
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  return &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head') && strlen(fugitive#head()) ? ' '.fugitive#head() : ''
endfunction

function! MyFileformat()
  return winwidth('.') > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth('.') > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth('.') > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth('.') > 60 ? lightline#mode() : ''
endfunction
