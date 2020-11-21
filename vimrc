" Configuration file for vim

" Prevent modelines in files from being evaluated (avoids a potential
" security problem wherein a malicious user could write a hazardous
" modeline into a file) (override default value of 5)
set modelines=0

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=indent,eol,start	" more powerful backspacing

" Now we set some defaults for the editor 
set autoindent		" always set autoindenting on
set textwidth=0		" Don't wrap words by default
set nobackup		" Don't keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more than
			" 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set foldlevelstart=99

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" We know xterm-debian is a color terminal
set t_Co=256
if &term =~ "xterm-debian" || &term =~ "xterm-xfree86"
  set t_Co=16
  set t_Sf=[3%dm
  set t_Sb=[4%dm
endif

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
syntax on

if has("autocmd")
 " Enabled file type detection
 " Use the default filetype settings. If you also want to load indent files
 " to automatically do language-dependent indenting add 'indent' as well.
 filetype plugin on

 autocmd BufRead,BufNewFile *.py set expandtab
 autocmd FileType sh set expandtab
 autocmd BufRead,BufNewFile *.py set diffopt=filler,context:3000
endif " has ("autocmd")

" Some Debian-specific things
augroup filetype
  au BufRead reportbug.*		set ft=mail
  au BufRead reportbug-*		set ft=mail
augroup END

" Set paper size from /etc/papersize if available (Debian-specific)
if filereadable('/etc/papersize')
  let s:papersize = matchstr(system('/bin/cat /etc/papersize'), '\p*')
  if strlen(s:papersize)
    let &printoptions = "paper:" . s:papersize
  endif
  unlet! s:papersize
endif

" The following are commented out as they cause vim to behave a lot
" different from regular vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make

" these are safer for navigating diffs
map ]j ]c
map ]k [c

" This is used during merges
map ]t :diffget 2<enter>:diffupdate<enter>

map d1 :diffget 1<enter>:diffupdate<enter>
map d2 :diffget 2<enter>:diffupdate<enter>
map d3 :diffget 3<enter>:diffupdate<enter>
map d4 :diffget 4<enter>:diffupdate<enter>

" Move to first diff when in diff mode
if &diff
    au VimEnter * exec "normal \]c"
endif

" some specific navigation commands
"command! Works :cd ~/linden/indra/newsim
"command! Workv :cd ~/linden/indra/newview
"command! Workp :cd ~/linden/indra/newspace
"command! Workd :cd ~/linden/indra/dataserver
"command! Worku :cd ~/linden/indra/userserver
"command! Workc :cd ~/linden/common
"command! Worki :cd ~/linden/include
"command! Workm :cd ~/linden/scripts/messages
"
"command! Branchs :cd ~/branch/linden/indra/newsim
"command! Branchv :cd ~/branch/linden/indra/newview
"command! Branchp :cd ~/branch/linden/indra/newspace
"command! Branchd :cd ~/branch/linden/indra/dataserver
"command! Branchu :cd ~/branch/linden/indra/userserver
"command! Branchc :cd ~/branch/linden/common
"command! Branchi :cd ~/branch/linden/include
"command! Branchm :cd ~/branch/linden/scripts/messages


" quick jump to the other C++ file
command! Cfile :e %:r.cpp
command! Hfile :e %:r.h
command! Csplit :split %:r.cpp
command! Hsplit :split %:r.h
command! Cvsplit :vsplit %:r.cpp
command! Hvsplit :vsplit %:r.h

"command! Diff :CVSVimDiff
"command! Diff :SVNVimDiff
command! Diff :VCSVimDiff

" Set up ctags
set tags=./tags,tags,~/linden/tags

" Map ,t to rebuild ctags in the current directory.
nmap ,t :!(cd %:p:h;ctags *.{cpp,h})&<CR><CR>
nnoremap <silent> <F8> :Tlist<CR>
nnoremap <silent> <F7> :TlistSync<CR>
nnoremap <silent> <F6> :TlistUpdate<CR>
nnoremap <silent> <F5> :TlistShowPrototype<CR>

" some abbreviations
abbreviate @a std::cout<space><<
abbreviate @b <<<space>std::endl;<space><tab>//<space>adebug
abbreviate @c //-----------------------------------------------------------------------------
abbreviate @d // adebug
abbreviate @i if()<return>{<return>}
abbreviate @e else<return>{<return>}
abbreviate @f if()<return>{<return>}<return>else<return>{<return>}<return>else<return>{<return>}
abbreviate @p {<return>}

set title
set titleold=""
set listchars=tab:>-
set list
set tabstop=4
set autoindent
 set expandtab
set shiftwidth=4
set smarttab
set hlsearch
set diffopt=filler,context:3000,iwhite
set formatoptions=qln

" colorscheme ChocolateLiquor
" colorscheme xylor
" colorscheme carvedwood
colorscheme jellybeans

map t :cn<Enter>
map T :cp<Enter>

let g:rainbow_active = 1

" let mapleader = ","
" let $ADDED = '~/.vim/added/'

" map <Leader>cd :exe 'cd ' . expand ("%:p:h")<CR>
" nmap <F1> :w<CR>
" imap <F1> <ESC>:w<CR>a
" map <F8> gg"+yG

let VCSCommandSplit = 'vertical'

"""""""""""""""""" POWERLINE """""""""""""""""
"if (v:version > 800) && !empty($POWERLINE_REPO)
"    set rtp+=$POWERLINE_REPO/bindings/vim/
"    set laststatus=2
"endif
"""""""""""""""""" POWERLINE """""""""""""""""
set t_Co=256

"if isdirectory($GOPATH)
"  call pathogen#infect() 
"endif

execute pathogen#infect()


