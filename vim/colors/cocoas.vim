" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:	Gaspard Bucher <g.bucher@teti.ch>
" Last Change:	2003 June 09

set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "cocoas"

hi Comment term=bold ctermfg=Green guifg=Green
hi Normal guifg=black guibg=white
hi Title term=bold guifg=black guibg=white
hi String term=underline ctermfg=DarkRed guifg=#a02222
hi Constant term=underline ctermfg=Blue guifg=Blue
hi Special term=bold ctermfg=Magenta guifg=#992255
hi Identifier term=underline ctermfg=Blue guifg=#222299
hi Statement term=bold ctermfg=DarkRed gui=NONE guifg=DarkRed
hi PreProc term=underline ctermfg=Brown guifg=Brown
hi Type term=underline ctermfg=Blue gui=NONE guifg=Blue
hi Visual term=reverse ctermfg=Yellow ctermbg=Red gui=NONE guifg=Black guibg=Yellow
hi Search term=reverse ctermfg=Black ctermbg=LightGreen gui=NONE guifg=Black guibg=LightGreen
hi Tag term=bold ctermfg=DarkGreen guifg=DarkGreen
hi Error term=reverse ctermfg=15 ctermbg=9 guibg=Red guifg=White
hi Todo term=standout ctermbg=Yellow ctermfg=Black guifg=Blue guibg=Yellow
hi  StatusLine term=bold,reverse cterm=NONE ctermfg=Yellow ctermbg=DarkGray gui=NONE guifg=Yellow guibg=DarkGray
hi! link MoreMsg Comment
hi! link ErrorMsg Visual
hi! link WarningMsg ErrorMsg
hi! link Question Comment
hi link Character	Constant
hi link Number	Constant
hi link Boolean	Constant
hi link Float		Number
hi link Function	Identifier
hi link Conditional	Statement
hi link Repeat	Statement
hi link Label		Statement
hi link Operator	Statement
hi link Keyword	Statement
hi link Exception	Statement
hi link Include	PreProc
hi link Define	PreProc
hi link Macro		PreProc
hi link PreCondit	PreProc
hi link StorageClass	Type
hi link Structure	Type
hi link Typedef	Type
hi link SpecialChar	Special
hi link Delimiter	Special
hi link SpecialComment Special
hi link Debug		Special
