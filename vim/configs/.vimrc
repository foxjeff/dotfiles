"$Id: .vimrc,v 1.33 2007/09/16 05:56:30 jeff Exp jeff $
"if has("terminfo")
"	set t_Co=8
"	set t_Sf=[3%p1%dm
"	set t_Sb=[4%p1%dm
"else

"	set t_Co=8
"	set t_Sf=[3%dm
"	set t_Sf=[4%dm
"endif
let g:rvRcsOptions="-kkv"

"function s:Cursor_Moved() 

  "let cur_pos= line ('.') 

  "if g:last_pos==0 
    "set cul 
    "let g:last_pos=cur_pos 
    "return 
  "endif 

"let diff= g:last_pos - cur_pos 

"if diff > 1 || diff < -1 
   "set cul 
  "else 
   "set nocul 
"end 

"let g:last_pos=cur_pos 
     
"endfunction 

"autocmd CursorMoved,CursorMovedI * call s:Cursor_Moved() 
"let g:last_pos=0
cnoremap <C-A> <HOME>
cnoremap <S-C-D> <Delete>
"set wildmenu


command! Bclose call <SID>BufcloseCloseIt() 

function! <SID>BufcloseCloseIt() 
	let l:currentBufNum = bufnr("%") 
	let l:alternateBufNum = bufnr("#") 

	if buflisted(l:alternateBufNum) 
		buffer # 
	else 
		bnext 
	endif 

	if bufnr("%") == l:currentBufNum 
		new 
	endif 

	if buflisted(l:currentBufNum) 
		execute("bdelete ".l:currentBufNum) 
	endif 
endfunction 
map \bc	:Bclose<CR>

cno \h ~/
cno \v ~/.vim/
cno \\ ~/.
nmap <silent> \bb :call BufferList()<CR>
nmap <silent> \z <Plug>ToggleProject 

set dir=/tmp
set laststatus=2
"set statusline=%<%f%h%m%r%=%l,%c%V\ %P
set ruler
"set syntax=help
set syntax=on
set showmatch
set showcmd
set incsearch
set so=9999
set backspace=2
"set term=mach-color
set term=xterm-color
set t_Co=16
"set t_kD=
set hls
colorscheme vividchalk "moria
set background=dark
hi Search ctermfg=7 ctermbg=8
hi WildMenu ctermbg=none
hi Visual ctermfg=8 ctermbg=7
hi StatusLine cterm=bold
hi StatusLine ctermfg=16
hi StatusLine ctermbg=7
hi StatusLineNC cterm=none
hi Comment ctermfg=2
"
"set mouse=a
"set gfn=Andale\ Mono:h14
set autoindent
set smartindent
set ignorecase
set smartcase
set history=500
"what was:
"set softtabstop=4
"set shiftwidth=4
"set tabstop=4
set softtabstop=2
set shiftwidth=2
set tabstop=2
"
"let Tlist_Inc_Winwidth=0
filetype on
filetype plugin on
filetype indent on
"compiler ruby
syntax enable
set pastetoggle=<F4>
"nmap <F1> :bNext
"nmap <F2> :bnext
nmap <F1> gT
nmap <F2> gt
nmap <F3> :nohlsearch
nmap , 
nmap - 
nmap   <PageDown>
nmap ,  <PageUp>
"map  <Del>
imap  <Del>
imap jj <esc>
nmap qq :q
"pastes from the clipboard:
nmap \p "*p
nmap \P "*P

vnoremap > >gv
vnoremap < <gv
noremap <silent> <F5> :buffers<CR>
"
runtime ftplugin/man.vim
"source ~/.vim/compiler/ruby.vim
"
"set statusline=%<%f%h%m%r\ \ %([%{Tlist_Get_Tagname_By_Line()}]%)%=%l,%c%V\ %P
set statusline=%<%f%h%m%r\ \ %=%l,%c%V\ %P
"let g:Tlist_Ctags_Cmd='/opt/local/bin/ctags'
"noremap <silent> <F5> :Tlist<CR>
autocmd BufEnter * :syntax sync fromstart

function! Ruby_eval_vsplit() range
  let src = tempname()
  let dst = tempname()
  execute ": " . a:firstline . "," . a:lastline . "w " . src
  execute ":silent ! ruby " . src . " > " . dst . " 2>&1 "
  execute ":redraw!"
  execute ":vsplit"
  execute "normal \<C-W>l"
  execute ":e! " . dst
  execute "normal \<C-W>h"
endfunction
   
vmap <silent> \r :call Ruby_eval_vsplit()<cr>
nmap <silent> <F7> mzggVG\r`z
imap <silent> <F7> <ESC>\r a
map <silent> \wb <C-W>l:bw<cr>
imap <silent> <S-F7> <ESC><S-F7>a
"
map <silent> \ww :w<cr>
imap <leader>ww <esc>:w<cr>
map \bw :bw<CR>
"
nmap <silent><leader>] o<esc>
nmap <silent><leader>[ O<esc>

nun ,<SPACE>
map , :bprevi<CR>
"map . :bnext<CR>
"
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
"
map <leader>f :WinFullScreen<cr>
unmap <esc>,
unmap <esc>-
"unmap <esc>r
hi Search ctermfg=7 ctermbg=8
hi WildMenu ctermbg=none
hi Visual ctermfg=8 ctermbg=7
hi StatusLine cterm=bold
hi StatusLine ctermfg=0
hi StatusLine ctermbg=7
hi StatusLineNC cterm=none
hi Comment ctermfg=2


set viminfo^=!
let g:proj_flags='imstgv'             " Project default flags for windows/mac ***added gv flags****
let g:rails_default_file='config/database.yml'
