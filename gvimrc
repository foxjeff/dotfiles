" Make external commands work through a pipe instead of a pseudo-tty
set noguipty

set ch=2		" Make command line two lines high
set mousehide		" Hide the mouse when typing text
set number

"this is set in .vimrc
"set nocursorline

"changed insert cursor to blink a bit
set gcr=n-v-c:block-Cursor/lCursor-blinkon0,ve:ver35-Cursor-blinkon0,o:hor50-Cursor-blinkon0,i-ci:ver25-Cursor/lCursor-blinkon800-blinkwait700-blinkoff800,r-cr:hor20-Cursor/lCursor-blinkon0,sm:block-Cursor-blinkon0

let moria_style = 'dark'
colorscheme moria

hi CursorLine guibg=#333333
hi StatusLine guifg=white

set gfn=PT\ Mono:h13
"set gfn=Inconsolata:h15
set antialias
"changing this so no mouse in insert mode
"to guard against unwanted buffer switching
set mouse=nvchr
"set guioptions=agimrLt
set guioptions=aAg
set backspace=indent,eol,start
set lines=61
set columns=100

"command-t stuff
"let g:CommandTMaxHeight = 10 "set in .vimrc
let g:CommandTMatchWindowAtTop=1
let g:CommandTMatchWindowReverse=1
if has("gui_macvim")
	macmenu &File.New\ Tab key=<nop>
	map <D-t> :CommandT<CR>
endif

"eof
