" Make external commands work through a pipe instead of a pseudo-tty
set noguipty

set ch=2		" Make command line two lines high
set mousehide		" Hide the mouse when typing text
set dir=/tmp

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>
" I like highlighting strings inside C comments
let c_comment_strings=1
set gcr=n-v-c:block-Cursor/lCursor-blinkon0,ve:ver35-Cursor-blinkon0,o:hor50-Cursor-blinkon0,i-ci:ver25-Cursor/lCursor-blinkon0,r-cr:hor20-Cursor/lCursor-blinkon0,sm:block-Cursor-blinkon0
"colorscheme scite2
let moria_style = 'black'
colorscheme vividchalk "moria
"hi Normal guibg=black
hi Search ctermbg=8
"stuff from .vimrc
set nocompatible
syntax enable
filetype on
filetype indent on
filetype plugin on
"compiler ruby
"
set pastetoggle=<F4>
set wildignore=*.0,*.class
set number
"set tags=~/work/newclient/tags
"nmap <F1> :bNext
"nmap <F2> :bnext
nmap <F1> gT
nmap <F2> gt
nmap <F3> :nohlsearch
nmap , 
nmap - 
"nmap   <PageDown>
"nmap ,  <PageUp>
"imap  <Del>
imap jj <esc>
imap kk <esc>u
imap '' ''<LEFT>
imap "" ""<LEFT>
imap {{ {}<LEFT>
imap [[ []<LEFT>
imap (( ()<LEFT>
imap << <><LEFT>
"map ;; :
"nmap II I//j
map qq :q
nmap <S-Up> 
nmap <S-Down> 
nmap <F5> :buffers<CR>
"nmap <F6> :set syntax=html<CR>
"nmap <F7> :set syntax=javascript<CR>
"nmap <F8> :set syntax=php<CR>

vmap <silent> \r :call Ruby_eval_vsplit()<cr>
nmap <silent> <F7> mzggVG\r`z
imap <silent> <F7> <ESC>\r a
map <silent> \wb <C-W>l:bw<cr>
imap <silent> <S-F7> <ESC><S-F7>a
"
map <silent> \ww :w<cr>
map <silent> \bw :bw<CR>
map <silent> \v 
"
"nun ,<SPACE>
"map \, :bprevious<CR>
"map \. :bnext<CR>
"
map <silent> <leader>f :WinFullScreen<cr>
"
"nmap <TAB> :bn<CR>
"nmap <S-TAB> :bp<CR>
set hidden
"
unmap <esc>,
unmap <esc>-
"unmap <esc>r
"
let g:miniBufExplorerMoreThanOne=100
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1 
let g:miniBufExplSplitBelow = 1
"runtime ftplugin/man.vim
"let g:loaded_matchit = 1
set hls
"
"  set gfn=Andale\ Mono:h14
"set gfn=9x15,font
"set gfn=Courier::h14
set gfn=Monaco::h13
set antialias
" for vim 7:
if exists('&macatsui')
  set nomacatsui
endif
set autoindent
set smartindent
set history=500
"old
"set softtabstop=4
"set shiftwidth=4
"set tabstop=4
set softtabstop=2
set shiftwidth=2
set tabstop=2
set mouse=a
set laststatus=2
"set statusline=%<%f%h%m%r\ \ %([%{Tlist_Get_Tagname_By_Line()}]%)%=%l,%c%V\ %P
set statusline=%<%f%h%m%r\ \ %=%l,%c%V\ %P
"set statusline=%<%f%h%m%r%=%l,%c%V\ %P
set guioptions=agimrLt
set ruler
set showmatch
"set syntax=help
set syntax=on
set showmatch
set showcmd
set incsearch
set so=9999
set backspace=2
set ignorecase
set smartcase
""""""let g:Tlist_Ctags_Cmd='/opt/local/bin/ctags'
set lines=61
set columns=120
"let loaded_nerd_comments=1
"eof
