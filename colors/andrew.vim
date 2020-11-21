" Vim color file
" Maintainer:	Andrew Meadows <andrew@lindenlab.com>
" Last Change:	2004 March 11
" Licence:	Public Domain

" Light background
" No gui bold for clean look when using small fonts
" Pale backgrounds for gui diffs

"  0  Black
"  1  DarkRed
"  3  Brown, DarkYellow
"  2  DarkGreen
"  4  DarkBlue
"  5  DarkMagenta
"  6  DarkCyan
"  7  LightGray, LightGrey, Gray, Grey, White

" First remove all existing highlighting.
set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "andrew"

hi Normal guifg=Black guibg=White

" Groups used in the 'highlight' and 'guicursor' options default value.
hi ErrorMsg  term=standout cterm=bold ctermfg=7 ctermbg=1 guibg=Red guifg=White
hi IncSearch  term=reverse cterm=reverse gui=reverse
hi ModeMsg term=bold cterm=bold gui=none
hi StatusLine term=bold,reverse cterm=bold,reverse gui=reverse
hi StatusLineNC term=reverse cterm=reverse gui=bold gui=reverse
hi VertSplit term=reverse cterm=reverse gui=reverse
hi Visual  term=reverse cterm=reverse gui=reverse guifg=Grey guibg=fg
hi VisualNOS  term=bold,underline cterm=bold,underline gui=underline
"hi Cursor guibg=Orange guifg=Black
"hi Cursor guibg=DarkRed guifg=White
"hi Cursor guibg=Black guifg=White
highlight Cursor gui=reverse guifg=NONE guibg=NONE
hi lCursor guibg=Cyan guifg=NONE
hi Directory term=bold ctermfg=4 gui=none guifg=Blue
hi LineNr term=underline ctermfg=3 gui=none guifg=Brown
hi MoreMsg term=bold ctermfg=2  gui=none guifg=SeaGreen
hi NonText term=bold cterm=bold ctermfg=4 gui=none guifg=Blue guibg=grey90
hi Question  term=standout ctermfg=2 gui=none guifg=SeaGreen
"hi Search term=standout ctermfg=Blue ctermbg=White gui=none guibg=Yellow guifg=NONE
hi Search term=standout ctermfg=Blue ctermbg=White gui=none guibg=DarkSeaGreen1 guifg=Black
hi SpecialKey term=bold ctermfg=4 gui=none guifg=Blue
hi Title term=bold ctermfg=5 gui=bold gui=none guifg=Magenta
hi WarningMsg term=bold,underline cterm=bold,underline gui=none guifg=Red
hi WildMenu term=standout ctermfg=0 ctermbg=3 gui=none guibg=Yellow guifg=Black
hi Folded term=standout ctermfg=4 ctermbg=7 gui=none guibg=White guifg=DarkBlue
hi FoldColumn term=standout ctermfg=4 ctermbg=7 gui=none guibg=Grey guifg=DarkBlue

" diff highlights
hi DiffText term=bold cterm=bold ctermfg=red ctermbg=White gui=none guibg=plum1
hi DiffAdd term=bold ctermfg=Black ctermbg=White gui=none guibg=LemonChiffon
hi DiffChange term=bold ctermfg=blue ctermbg=White gui=none guibg=SlateGray1
"hi DiffDelete term=bold cterm=bold ctermfg=magenta ctermbg=8 gui=none guifg=Blue guibg=DarkSeaGreen1
hi DiffDelete term=bold cterm=bold ctermfg=magenta ctermbg=8 gui=none guifg=gray79 guibg=gray95

" Colors for syntax highlighting
hi Comment term=bold ctermfg=4 gui=none guifg=#AC2020 guibg=White
hi Constant term=underline ctermfg=1 gui=none guifg=#C28F8F guibg=White
hi PreProc term=underline ctermfg=5 gui=none guifg=#D569D5 guibg=White
hi Statement term=bold ctermfg=3 gui=NONE guifg=#9C20EE guibg=White
hi Type term=underline ctermfg=2 gui=none guifg=#9C20EE guibg=White
hi Special term=bold ctermfg=5 gui=none guifg=SlateBlue guibg=White
hi Ignore cterm=bold ctermfg=7 gui=none guifg=White
hi Error term=reverse cterm=bold ctermfg=7 ctermbg=1 gui=none guifg=White guibg=Red
hi Todo term=standout ctermfg=Black ctermbg=White guifg=Blue guibg=Yellow
" Some specials (override hilinks)


" vim: sw=2
