" Autocommands for bundles
"autocmd VimEnter,colorscheme * :hi IndentGuidesOdd guibg=red ctermbg=3
"autocmd VimEnter,colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
autocmd InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

autocmd InsertLeave * set nopaste

autocmd InsertEnter * :set number
autocmd insertLeave * :set relativenumber
