syntax on
filetype plugin on
set nocp
set nocompatible
set wrapscan
set showmatch
set incsearch
set ls=2
set tabstop=4
set shiftwidth=4
set showcmd
set hlsearch
set ruler
set visualbell
set nobackup
set nowrap
set number
set ignorecase
set title
set shortmess=atI
set nostartofline
set whichwrap=b,s,h,<,>,h
set expandtab
set sm
set backspace=2
set showmode
set modeline
"let python_highlight_all=0
set autoindent
set nosmartindent
set shiftwidth=4
colorscheme default
set background=light
vmap * y/<C-R>"<CR>
" ---------------------------------------------------                GUI options
set guioptions=+maegimrLt   " be spartan and show nothing
set guioptions-=rLT         " even more spartan: no scrollbars, no toolbars

set mousemodel=popup
set guifont=LucidaTypewriter\ 9

"set langmenu=en_GB
"highlight Comment ctermfg=grey
"let $LANG='en_GB'
"source $VIMRUNTIME/delmenu.vim
"source $VIMRUNTIME/menu.vim
" ----------------------------------------------------                 80 columns
set textwidth=250
set colorcolumn=80
" ----------------------------------------------------                   Taglist 
nnoremap <silent> <S-F8> :TlistToggle<CR>
nnoremap <silent> <F8> :TlistHighlightTag<CR>
" ----------------------------------------------------       tab/buff Navigation
map <C-Tab> :bn<CR>
map <C-S-Tab> :bp<CR>
map <Tab-Pgup> :tabn<CR>
map <Tab-Pgdn> :tabp<CR>

" ---------------------------------------------------    clear search highlight 
map <F12> :nohl<CR>
" ---------------------------------------------------                     ctags
"map <F2> : !ctags -R -V --links=yes --exclude=*.SYNC* <CR>
"map <F2> : !~/bin/bin/ctags -R -V --links=yes --fields=+afmikKlnsStz --exclude=*.SYNC*   --exclude=*aria_A0_chip/release/*  --exclude=*aria_A0/release/* --exclude=*.html --exclude=*.htm --exclude=*.tcl --exclude=*.js --exclude=*my_regression* -f new_tags

"map <F2> : !ctags --options=NONE -R -V --links=no --fields=+lS --languages=python --exclude=doc --exclude=docs --exclude=*egg* --python-kinds=-i<CR>
" ---------------------------------------------------                  foldings
"set foldmethod=syntax
:highlight Folded guibg=white guifg=grey
:highlight Normal guibg=grey100
":highlight Comment guibg=white guifg=grey
":highlight String guibg=white guifg=lightblue
:highlight Function gui=bold guifg=darkcyan

" ---------------------------------------------------       Utilities/Shortcuts
map <C-F2> a<C-R>=strftime("%c")<CR><Esc>
" ---------------------------------------------------    Spell plugin  shortcuts
map <F7> :SPC <CR>
map <F4> :SPP <CR>
map <F5> :SPN <CR>
" ---------------------------------------------------             quickfix mode
map <C-`> :cn
map <C-\> :cN
map T :TaskList<CR>
" ---------------------------------------------------             Python related
autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType python compiler pylint
autocmd FileType python let &makeprg='pylint %\|sed "s/^\(\w*\):\s*\([0-9]\+\)/%:\2:\ \1:\ /g"'

let g:SuperTabDefaultCompletionType = "context"
" ---------------------------------------------------            
"                                                               Smooth scrolling
"map <C-U> <C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y>
"map <C-D> <C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E>

if version >= 704
    noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
    noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
    noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
    noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>
endif

let g:airline_powerline_fonts = 1
set guitablabel=\[%N\]\ %t\ %M      " Custom label for tabs: [n]gt
set t_Co=256                        " more colors in the palette


if has("gui_running")
    let g:airline_theme='cool'
else
    let g:airline_theme='cool'
endif    


