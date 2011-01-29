" Gökmen Göksel .vimrc
" gokmeng_gmail.com
"

set vb
set number
set guifont=Droid\ Sans\ Mono\ 10
set guioptions-=T
set guioptions-=m
set guioptions-=r
set clipboard=autoselect,unnamed,exclude:cons\|linux
set cursorline
set completeopt=longest,menuone
set foldmethod=manual

filetype plugin indent on

autocmd BufReadPre *.pdf set ro
autocmd BufReadPost *.pdf %!pdftotext -nopgbrk "%" -

colorscheme vibrantink

highlight StatusLine guibg=darkred guifg=white
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.*/

imap <C-S-tab> <ESC>:tabprevious<cr>i
imap <C-tab> <ESC>:tabnext<cr>i

nmap <S-<> :previous<cr>
nmap <C->> :next<cr>
nmap <C-S-tab> :tabprevious<cr>
nmap <C-tab> :tabnext<cr>
nmap <C-r> :!python "%"<cr>
nmap <C-e> :Explore<cr>

map <C-S-tab> :tabprevious<cr>
map <C-tab> :tabnext<cr>
map <c-s><c-f> :!svn ci "%" -m "
map <c-w><c-f> :FirstExplorerWindow<cr>
map <c-w><c-b> :BottomExplorerWindow<cr>
map <c-w><c-t> :WMToggle<cr>
map <c-s><c-s> :!svn st<cr>
map <c-s><c-d> :!svn di "%"<cr>

let Grep_Default_Options = '-i -r'
let Grep_Skip_Dirs = 'build'
let Grep_Skip_Files = '*.bak *~ *.pyc'

let g:DoxygenToolkit_briefTag_pre="@Synopsis " 
let g:DoxygenToolkit_paramTag_pre="@Param " 
let g:DoxygenToolkit_returnTag="@Returns   " 
let g:DoxygenToolkit_blockHeader="---"
let g:DoxygenToolkit_blockFooter="---"
let g:DoxygenToolkit_authorName="Gökmen Göksel" 
let g:DoxygenToolkit_licenseTag="# Copyright (C)"

let g:pydiction_location = '/home/gokmen/.vim/pydict/complete-dict'

:autocmd FileType python set omnifunc=pythoncomplete#Complete
