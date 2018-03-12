" Vim filetype plugin file
" Language:	SystemVerilog (superset extension of Verilog)
" Maintainer:	Amit Sethi <amitrajsethi@yahoo.com>
" Last Change:	Tue Jun 26 08:56:34 IST 2006
" Version: 1.0

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif

setlocal foldmethod=indent "set this to manual for faster running
setlocal foldignore-=/*
setlocal shiftwidth=2
setlocal ts=2
setlocal foldcolumn=4
"setlocal foldmethod=expr
set foldexpr=MyFoldExpr(v:lnum)
function! MyFoldExpr(line)
   let str = getline(a:line)   
   if str =~ 'case\s*(.\+)' || str =~ '^\s*function\s' ||str=~'`ovm_object_utils_begin'
      return 'a1'   
   elseif str =~ '\<endcase\>' || str =~ '^\s*endfunction' || str=~'`ovm_object_utils_end'
      return 's1'
   elseif str =~ '\<begin\>' 
      return 'a1'
   elseif str =~ '\<end\>' 
      return 's1'
   elseif str =~ '\<for\>\s*(.*)' 
      return 'a1'
   elseif str =~ '\<end\>' 
      return 's1'
   elseif str =~ '\<task\>\s*.*' 
      return 'a1'
   elseif str =~ '\<endtask\>\s*' 
      return 's1'
   elseif str =~ '\<module\>' 
      return 'a1'
   elseif str =~ '\<endmodule\>' 
      return 's1'

   else
       return -1
   endif

endfunction

" Behaves just like Verilog
"
"runtime! ftplugin/verilog.vim
if exists('loaded_matchit')
let b:match_ignorecase=0
let b:match_words=
  \ '\<begin\>:\<end\>,' .
  \ '\<if\>:\<else\>,' .
  \ '\<module\>:\<endmodule\>,' .
  \ '\<class\>:\<endclass\>,' .
  \ '\<program\>:\<endprogram\>,' .
  \ '\<clocking\>:\<endclocking\>,' .
  \ '\<property\>:\<endproperty\>,' .
  \ '\<sequence\>:\<endsequence\>,' .
  \ '\<package\>:\<endpackage\>,' .
  \ '\<covergroup\>:\<endgroup\>,' .
  \ '\<primitive\>:\<endprimitive\>,' .
  \ '\<specify\>:\<endspecify\>,' .
  \ '\<generate\>:\<endgenerate\>,' .
  \ '\<interface\>:\<endinterface\>,' .
  \ '\<function\>:\<endfunction\>,' .
  \ '\<task\>:\<endtask\>,' .
  \ '\<case\>\|\<casex\>\|\<casez\>:\<endcase\>,' .
  \ '\<fork\>:\<join\>\|\<join_any\>\|\<join_none\>,' .
  \ '`ifdef\>:`else\>:`endif\>,' .
  \ '\<generate\>:\<endgenerate\>,'
endif

function! MyBalloonExpr()
    if  v:beval_text[0:2] == 'BF_'
        let my_cmd =  '~/bin/bin/db_search -bf '.v:beval_text 
        return system(my_cmd)
    endif

    if  v:beval_text[-5:] == '_ADDR'
        let my_cmd =  '~/bin/bin/db_search -reg '.v:beval_text 
        return system(my_cmd)
    endif
    return ""


endfunction

set bexpr=MyBalloonExpr()
set ballooneval
set balloondelay=100
