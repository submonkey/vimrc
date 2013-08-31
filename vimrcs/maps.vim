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
nnoremap J <c-f>
nnoremap K <c-b>

" Remapping
nnoremap ; :
vnoremap ; :
inoremap jj <esc>
nnoremap vv <c-v>
nnoremap U <c-r>

vnoremap L >gv
vnoremap K xkP`[V`] 
vnoremap J xp`[V`] 
vnoremap H <gv

noremap <leader>h <c-w>h
noremap <leader>j <c-w>j
noremap <leader>k <c-w>k
noremap <leader>l <c-w>l

inoremap <leader>n <c-n>
inoremap <leader>p <c-p>
