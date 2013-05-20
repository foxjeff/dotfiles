" Vim color file
" Maintainer:	Gergely Kontra <kgergely@mcl.hu>
" Modified:	jfox
" Last Change:	04.05.06 heh

set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "scite2"

" hardcoded colors :

" GUI

highlight Normal	guifg=#000000
highlight Search	guibg=lightgreen
highlight Visual	guifg=#555555
highlight Folded	guifg=#ffffff	guibg=#666666
highlight Cursor	guifg=#ffffff	guibg=#000000 gui=bold
highlight Special	guifg=#7F007F	guibg=#eeeeff gui=bold
highlight Comment	guifg=#007F00	guibg=#eeeeee
highlight StatusLine	guifg=#000000	guibg=#aacccc
highlight StatusLineNC	guifg=#557777	guibg=#ffffff
highlight Statement	guifg=#000000		      gui=bold
highlight Identifier	guifg=#000000	guibg=NONE    gui=NONE
highlight Type		guifg=#0000ff		      gui=NONE
highlight Function	guifg=#007F7F		      gui=bold
highlight LineNr	guifg=#000000	guibg=#bbbbbb
highlight FoldColumn	guifg=#000000	guibg=#dddddd
highlight Define	guifg=#00007F	guibg=#ddddff gui=bold
highlight Number	guifg=#000000	guibg=#eeffff gui=bold
highlight Subtitle	guifg=#000000	guibg=#66bbbb gui=bold,underline
highlight String	guifg=#0C6605
"#7F007F
highlight Delimiter	guifg=#000000		      gui=bold
highlight PreProc	guifg=#0000ff	guibg=#ffffff gui=bold
highlight Constant	guifg=#000000		      gui=underline

