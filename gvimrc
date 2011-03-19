" Make external commands work through a pipe instead of a pseudo-tty
set noguipty

set ch=2		" Make command line two lines high
set mousehide		" Hide the mouse when typing text
set number
set nocursorline
set gcr=n-v-c:block-Cursor/lCursor-blinkon0,ve:ver35-Cursor-blinkon0,o:hor50-Cursor-blinkon0,i-ci:ver25-Cursor/lCursor-blinkon0,r-cr:hor20-Cursor/lCursor-blinkon0,sm:block-Cursor-blinkon0

let moria_style = 'dark'
colorscheme moria

set gfn=Inconsolata:h15
set antialias
set mouse=a
"set guioptions=agimrLt
set guioptions=agi
set backspace=2
set lines=61
set columns=100

"command-t stuff
let g:CommandTMaxHeight = 10
if has("gui_macvim")
	macmenu &File.New\ Tab key=<nop>
	map <D-t> :CommandT<CR>
endif

"eof
