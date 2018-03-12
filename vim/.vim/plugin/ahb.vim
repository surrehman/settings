
function! MyBalloonExpr()
    if  v:beval_text[0:2] == 'BF_'
        let my_cmd =  '~/bin/bin/db_search -b '.v:beval_text 
        return system(my_cmd)
    endif

    if  v:beval_text[-5:] == '_ADDR'
        let my_cmd =  '~/bin/bin/db_search -r '.v:beval_text 
        return system(my_cmd)
    endif
    return ""


endfunction

set bexpr=MyBalloonExpr()
set ballooneval
set balloondelay=100



function! MyFunction2()
  let wordUnderCursor = expand("<cword>")
    if  wordUnderCursor[0:2] == 'BF_'
        let my_cmd =  '~/bin/bin/db_search -b '.wordUnderCursor
    endif
    if  v:beval_text[-5:] == '_ADDR'
        let my_cmd =  '~/bin/bin/db_search -r '.wordUnderCursor
    endif
    
  echomsg system(my_cmd)

endfunction
