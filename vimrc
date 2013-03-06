"
call pathogen#runtime_append_all_bundles()

filetype on
filetype plugin on
filetype indent on
syntax enable

set nocompatible
set viminfo=!,'100,<50,s10,h,n~/Dropbox/dotfiles-mbp/.viminfo
set vb "visual bell to get rid of annoying noises
set cursorline
set wildignore=*.0,*.class,#*,*~
set dir=/tmp
"set backupdir=/tmp
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
"timeoutlen is how long pressing <ESC> delays; default is 1000ms
set timeoutlen=500

"colorscheme stuff
"let g:solarized_termcolors=256 "    |   16
"let g:solarized_termtrans =   0       |   1
"let g:solarized_degrade   =   0       |   1
"let g:solarized_bold      =   1       |   0
"let g:solarized_underline =   1       |   0
"let g:solarized_italic    =   1       |   0
"let g:solarized_style     ="dark" " |   light
"let g:solarized_contrast="high" "or low
set background=dark
let g:liquidcarbon_high_contrast=5
colorscheme liquidcarbon
"colorscheme solarized
"colorscheme xoria256
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
"makes v copy to clipboard
set clipboard+=autoselect
"ConqueTerm
"let g:ConqueTerm_CWInsert = 1

"let loaded_matchit = 1
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

"paredit - no shortmaps, changes J and O among other things
let g:paredit_shortmaps=0

"command-t stuff
let g:CommandTMaxHeight = 10
nmap <F6> :CommandT<cr>

"line numbering toggle from:
"http://superuser.com/questions/339593/vim-toggle-number-with-relativenumber
noremap <silent><F7> :exec &nu==&rnu? "se nu!" : "se rnu!"<CR>

"for vimclojure
let g:vimclojure#WantNailgun=1

"vim-coffee-script
let g:coffee_compile_on_save = 1

"Preview
let g:PreviewBrowsers='open -g -a Safari'

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
nmap <TAB> <C-W>w
nmap j gj
nmap k gk
nmap t o<ESC>k 
nmap T O<ESC>j 
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
"hi CursorLine cterm=none ctermbg=234
"hi Visual ctermfg=black ctermbg=white
"hi StatusLine  cterm=bold ctermfg=White ctermbg=235 "was 239
"hi StatusLineNC cterm=none ctermfg=244 ctermbg=235
"
"hi StatusLineModified term=bold,reverse cterm=bold,reverse ctermfg=White 
"gui=bold,reverse guifg=DarkRed
"
"hi StatusLineSpecial term=bold,reverse cterm=bold,reverse ctermfg=4 ctermbg=15 
"gui=bold,reverse guifg=DarkBlue
"hi StatusLineSpecialNC ctermbg=236
"hi MatchParen ctermfg=green ctermbg=none

"hi Search ctermfg=7 ctermbg=8
"hi WildMenu ctermbg=none
"hi Visual ctermfg=8 ctermbg=7
"hi StatusLine cterm=bold ctermfg=0 ctermbg=7
"hi StatusLineNC cterm=none ctermbg=8 ctermfg=0
"hi Comment ctermfg=2
"hi ModeMsg ctermfg=5 cterm=reverse

"these au's don't really work for me anymore: Fri Feb 18 18:38:36 CST 2011
"seem to be working now Fri Jul  6 16:25:46 CDT 2012
au WinEnter * set cursorline
au WinLeave * set nocursorline
"autocmd BufEnter * :syntax sync fromstart
"
"But these work
au InsertEnter * setlocal nocursorline
au InsertLeave * setlocal cursorline
au InsertLeave * set nopaste

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
