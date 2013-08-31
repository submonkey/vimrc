autocmd FileType python       setlocal omnifunc=pythoncomplete#Complete
autocmd FileType javascript   setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html         setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType css          setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType xml          setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType php          setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType c            setlocal omnifunc=ccomplete#Complete

autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

autocmd InsertLeave * set nopaste

autocmd InsertEnter * :setlocal number
autocmd insertLeave * :setlocal relativenumber
