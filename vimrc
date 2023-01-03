" Configuration file for vim

" Basic Settings

set ttymouse=xterm2
set mouse=a
set shell=/bin/zsh
set clipboard^=unnamed,unnamedplus
" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible
" Prevent modelines in files from being evaluated (avoids a potential
" security problem wherein a malicious user could write a hazardous
" modeline into a file) (override default value of 5)
set modelines=0
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
if has("mouse")  " Don't show tabs/trailing spaces if copy/paste will show them
    set list lcs=trail:·,tab:»·,nbsp:! " Show tabs and trailing spaces
endif
set encoding=utf-8
set scrolloff=3
set autoindent                  " always set autoindenting on
set wildmenu
set wildmode=longest:full,full
set ttyfast

set noundofile                  " Don't keep undo files
set nobackup                    " Don't keep backup files
" search using 'very magic' patterns
nnoremap / /\v
vnoremap / /\v
set ignorecase                  " Ignore case during search
set smartcase                   " ... unless searching for a mix of upper/lower
"set gdefault
set incsearch                   " Incremental search
set showmatch                   " Show matching brackets.
set hlsearch                    " Highlight search matches
" Mapping to remove search highlights
if has("user_commands")
    let mapleader = ";"
    nnoremap <leader><space> :noh<cr>
endif " has("user_commands")
nnoremap <TAB> %
vnoremap <TAB> %
set wrap
set linebreak
set formatoptions=qrn1
" Set spelling language, but turn it off by default.
set spell spelllang=en_us
set nospell
"set autowrite  " Automatically save before commands like :next and :make

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set diffopt=filler,context:3000,iwhite

if has("autocmd")
  " Enabled file type detection
  " Use the default filetype settings. If you also want to load indent files
  " to automatically do language-dependent indenting add 'indent' as well.
  filetype plugin indent on

  augroup vimrc_autocmd
    "autocmd FileType sh set expandtab
    "autocmd BufRead,BufNewFile *.py set expandtab
    " Don't ignore whitespace in python diffs
    autocmd BufRead,BufNewFile *.py set diffopt-=iwhite

    " Set syntax on env files
    autocmd BufRead,BufNewFile *.envrc set syntax=sh

    " Folding
    " Set foldlevel to the highest foldlevel in the current file
    autocmd BufWinEnter * let &foldlevel = max(map(range(1, line('$')), 'foldlevel(v:val)'))

    " Move to first diff when in diff mode
    if &diff
        au VimEnter * exec "normal \]c"
    endif
  augroup END
endif " has("autocmd")

" Aesthetics

set t_Co=256
if has("user_commands")
    " Enable true color
    let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors

    packadd! dracula
    if !exists("g:syntax_on")
        syntax enable
    endif
    colorscheme dracula
    highlight Normal ctermbg=None
endif " has("termguicolors")

" Highlight any characters in lines that are too long.
"set colorcolumn=81
"if has("autocmd")
"  augroup vimrc_overlength
"    autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#592929
"    autocmd BufEnter * match OverLength /\%81v.*/
"  augroup END
"endif " has("autocmd")

" Mappings and shortcuts

" Leader shortcuts

nnoremap <leader>a :Ack
nnoremap <leader>ft Vatzf
nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>
nnoremap <leader>q gqip
nnoremap <leader>v V`]
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>j VipJ
nnoremap <leader>q gqip
nnoremap <leader>f 1z=
nnoremap <leader>s ]s
nnoremap <leader>u :!git pull website master && git commit -am 'Standard commit.' && git push website master<CR><CR>
nnoremap <leader>p :!git commit -am 'Standard commit.' && git push origin master<CR><CR>
nnoremap <leader>d :read !date<CR>
nnoremap <leader>r :!!<CR>
nnoremap <leader>m :normal @a
nnoremap <leader>l :CtrlP<CR>
nnoremap <leader>nt :NERDTree<CR>
nnoremap <leader>s :set spell!<CR>
nnoremap <leader>n :set nonumber!<CR>
nnoremap <leader>rn :set norelativenumber!<CR>
nnoremap <leader>c :nohl<CR>
nnoremap <leader>pa :set nopaste!<CR>
nnoremap <leader>rc :so $MYVIMRC<CR>
nnoremap <leader>b :BlogSave publish<CR>
"nnoremap <leader>r :! /Users/daniel/Documents/whup.sh<CR><CR>
nnoremap <leader>h :set ft=HTML<CR><CR>

" Control shortcuts

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

