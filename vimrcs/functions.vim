function! g:UltiSnips_Complete()
    call UltiSnips_ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips_JumpForwards()
            if g:ulti_jump_forwards_res == 0
                return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

    " EITHER blink the line containing the match...
    "function! HLNext (blinktime)
        "set invcursorline
        "redraw
        "exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
        "set invcursorline
        "redraw
    "endfunction

    " OR ELSE ring the match in red...
    "function! HLNext (blinktime)
        "highlight RedOnRed ctermfg=red ctermbg=red
        "let [bufnum, lnum, col, off] = getpos('.')
        "let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
        "echo matchlen
        "let ring_pat = (lnum > 1 ? '\%'.(lnum-1).'l\%>'.max([col-4,1]) .'v\%<'.(col+matchlen+3).'v.\|' : '')
                "\ . '\%'.lnum.'l\%>'.max([col-4,1]) .'v\%<'.col.'v.'
                "\ . '\|'
                "\ . '\%'.lnum.'l\%>'.max([col+matchlen-1,1]) .'v\%<'.(col+matchlen+3).'v.'
                "\ . '\|'
                "\ . '\%'.(lnum+1).'l\%>'.max([col-4,1]) .'v\%<'.(col+matchlen+3).'v.'
        "let ring = matchadd('RedOnRed', ring_pat, 101)
        "redraw
        "exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
        "call matchdelete(ring)
        "redraw
    "endfunction

    " OR ELSE briefly hide everything except the match...
    "function! HLNext (blinktime)
        "highlight BlackOnBlack ctermfg=black ctermbg=black
        "let [bufnum, lnum, col, off] = getpos('.')
        "let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
        "let hide_pat = '\%<'.lnum.'l.'
                "\ . '\|'
                "\ . '\%'.lnum.'l\%<'.col.'v.'
                "\ . '\|'
                "\ . '\%'.lnum.'l\%>'.(col+matchlen-1).'v.'
                "\ . '\|'
                "\ . '\%>'.lnum.'l.'
        "let ring = matchadd('BlackOnBlack', hide_pat, 101)
        "redraw
        "exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
        "call matchdelete(ring)
        "redraw
    "endfunction

    " OR ELSE just highlight the match in red...
    function! HLNext (blinktime)
        let [bufnum, lnum, col, off] = getpos('.')
        let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
        let target_pat = '\c\%#'.@/
        let ring = matchadd('WhiteOnRed', target_pat, 101)
        redraw
        exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
        call matchdelete(ring)
        redraw
    endfunction
