" Reload vim configuration
noremap <leader>r :source ~/.vimrc<cr>
" Fast saving
noremap <leader>w :write!<cr>
inoremap <silent> <leader>w <esc>:write!<cr>
" Toggle paste mode
noremap <leader>pp <esc>:setlocal paste!<cr>

" Moving maps
noremap j gj
noremap k gk

" Remapping
nnoremap ; :
vnoremap ; :
inoremap jj <esc>
nnoremap vv <c-v>
