" Commands for doc writing
" "
" if exists('loaded_docctools')
"     finish
" endif
" let loaded_doctools=1
" 
" if v:version < 700
"     finish
" endif
" 
" let s:module_cmd = "cad modules; module load sync;"
" 
" function s:DSSCcommand(cmd_opt)
"     " get the full path of the current buffer
"     let this_buf_filename = expand("%:p")
"     " build the command
"     let dssc_cmd = "dssc ".a:cmd_opt." ".this_buf_filename
"     exec "! ".s:module_cmd." ".dssc_cmd
" endfunction
" 
" function s:CallPython(cmd_opt)
"     " Execute a python command 
"     call s:DSSCcommand(a:cmd_opt)
"     let lnx_cmd = "chmod u+w ".expand("%:p")
"     exec "! ".lnx_cmd
" endfunction
" 
" " Commands for non-module based environment
" command Loremipsum  call s:CallPython("co -get -nocomment")
" command DSSClock    call s:DSSCcommand("co -lock -nocomment")
" command DSSCmerge   call s:DSSCcommand("co -merge")
" command DSSCci      call s:DSSCcommand("ci")
" 
" " Commands for module based environment
" command DSSCmodget     call s:DSSCcommand_chmod_w("pop -get -unify")
" command DSSCmodlock    call s:DSSCcommand("pop -lock")
" "command DSSCmerge   call s:DSSCcommand("co -merge")
" command DSSCmodci      call s:DSSCcommand("ci -nonew -iflock")
" 
" 
" 
" " Commands valid in both module and non module environment
" command DSSCls              call s:DSSCcommand("ls -report status")
" command DSSClstags          call s:DSSCcommand("ls -report PRGSUV")
" command DSSCvhist           call s:DSSCcommand("vhist -report verbose+G")
" command DSSCdiff            call s:DSSCcommand("diff")
" command DSSCdiffgui         call s:DSSCcommand("diff -gui")
" command DSSCdiffLatest      call s:DSSCcommand("diff -version Latest")
" command DSSCdiffLatestgui   call s:DSSCcommand("diff -version Latest -gui")
" 
" command DSSCcancel          call s:DSSCcommand("cancel")
" command DSSCcancelforce     call s:DSSCcommand("cancel -force")
" command DSSCpopunify        call s:DSSCcommand("pop -unify")
" command DSSCpopunifyforce   call s:DSSCcommand("pop -unify -force")
" 
" 
" 
" amenu DocTools.Loremipsum       :Loremipsum<CR>
" amenu DocTools.-sep1-           :
" 
