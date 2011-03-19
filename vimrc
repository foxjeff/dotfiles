"
call pathogen#runtime_append_all_bundles()

filetype on
filetype plugin on
filetype indent on
syntax enable

set nocompatible
set viminfo=!,'100,<50,s10,h,n~/Dropbox/dotfiles-mbp/.viminfo
set vb "visual bell to get rid of annoying noises
"set cursorline
set wildignore=*.0,*.class,#*,*~
set dir=/tmp
set laststatus=2
set ruler
"set syntax=help
set syntax=on
set showmatch
set showcmd
set incsearch
set so=9999
set backspace=2
"set term=mach-color
"set term=xterm-color
set t_Co=256
"set t_kD=
set hls
colorscheme xoria256
"set background=dark
"
set autoindent
set smartindent
set ignorecase
set smartcase
set history=500
set softtabstop=2
set shiftwidth=2
set tabstop=2
set pastetoggle=<F4>
set hidden

"ConqueTerm
let g:ConqueTerm_CWInsert = 1

"yankring
let g:yankring_history_dir = '~/.vim/'
let g:yankring_history_file = '.yankring_history'

"minibufexplorer
let g:miniBufExplorerMoreThanOne=100
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1 
let g:miniBufExplSplitBelow = 1

"paredit
let g:paredit_shortmaps=1

"command-t stuff
let g:CommandTMaxHeight = 10
nmap <F6> :CommandT<cr>

"vim-coffee-script
let g:coffee_compile_on_save = 1

cnoremap <C-A> <HOME>
cno \h ~/
cno \v ~/.vim/
cno \\ ~/.

nmap <silent> \bb :call BufferList()<CR>
nmap <silent> \z <Plug>ToggleProject 

nmap <F1> :bp
nmap <F2> :bn
nmap <F3> :set hlsearch!<cr>
imap <F3> <esc>:set hlsearch!<cr>a
imap  <Del>
imap jj <esc>
imap kk <esc>u
imap uu <esc>u
map qq :q
"pastes from the clipboard:
nmap \pp "*p
nmap \PP "*P

vnoremap > >gv
vnoremap < <gv
"noremap <silent> <F5> :buffers<CR>
"
nmap <F5> \be
map \bw :bw<CR>

map <silent> \ww :w<cr>
imap <leader>ww <esc>:w<cr>

"nmap <silent><leader>] o<esc>
"nmap <silent><leader>[ O<esc>
nmap <SPACE> <PAGEDOWN>
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
"
map <silent> <leader>f :WinFullScreen<cr>

"these have questionable value with paredit mode
"imap '' ''<LEFT>
"imap "" ""<LEFT>
"imap {{ {}<LEFT>
"imap [[ []<LEFT>
"imap (( ()<LEFT>
"imap << <><LEFT>

runtime ftplugin/man.vim

"set statusline=%<%f%h%m%r\ \ %([%{Tlist_Get_Tagname_By_Line()}]%)%=%l,%c%V\ %P
"set statusline=%<%f%h%m%r\ \ %=%l,%c%V\ %P
"changed the above to make line numbers more clear and %p to show real %
"rather than Top/Bottom
set statusline=%<%f\ %m\ %y\ %r\ \ %=%l\ of\ %L,%c%V\ %p%%

"highlight stuff
hi CursorLine cterm=none
"hi Search ctermfg=7 ctermbg=8
"hi WildMenu ctermbg=none
"hi Visual ctermfg=8 ctermbg=7
"hi StatusLine cterm=bold ctermfg=0 ctermbg=7
"hi StatusLineNC cterm=none ctermbg=8 ctermfg=0
"hi Comment ctermfg=2
"hi ModeMsg ctermfg=5 cterm=reverse

"these au's don't really work for me anymore: Fri Feb 18 18:38:36 CST 2011
"au WinEnter * set cursorline
"au WinLeave * set nocursorline
"autocmd BufEnter * :syntax sync fromstart
"
"not sure about this: 
"function! Ruby_eval_vsplit() range
  "let src = tempname()
  "let dst = tempname()
  "execute ": " . a:firstline . "," . a:lastline . "w " . src
  "execute ":silent ! ruby " . src . " > " . dst . " 2>&1 "
  "execute ":redraw!"
  "execute ":vsplit"
  "execute "normal \<C-W>l"
  "execute ":e! " . dst
  "execute "normal \<C-W>h"
"endfunction
"or this
"vmap <silent> \r :call Ruby_eval_vsplit()<cr>
"nmap <silent> <F7> mzggVG\r`z
"imap <silent> <F7> <ESC>\r a
"map <silent> \wb <C-W>l:bw<cr>
"imap <silent> <S-F7> <ESC><S-F7>a
"
"(defun dbl (n)
"	(+ 2 (* n n)))
