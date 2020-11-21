" Vim color file
" Maintainer:	Michael Piefel <piefel@informatik.hu-berlin.de>
" Last Change:	2001 Aug 16
" Licence:	Public Domain

" This color scheme uses a White background. It's based on Bram's
" morning theme, but doesn't try to work for non-GUI editing.
" 
" It's supposed to look like the Emacs standard colors, at least
" for C. But Emacs has different categories, so it's not very good.

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

let colors_name = "emacs"

hi Normal guifg=Black guibg=White

" Groups used in the 'highlight' and 'guicursor' options default value.
hi ErrorMsg guibg=Red guifg=White
hi IncSearch gui=reverse
hi ModeMsg gui=none
hi StatusLine gui=reverse
hi StatusLineNC gui=reverse
hi VertSplit gui=reverse
hi Visual gui=reverse guifg=Grey guibg=fg
hi VisualNOS gui=underline
"hi Cursor guibg=Orange guifg=Black
"hi Cursor guibg=DarkRed guifg=White
"hi Cursor guibg=Black guifg=White
highlight Cursor gui=reverse guifg=NONE guibg=NONE
hi lCursor guibg=Cyan guifg=NONE
hi Directory gui=none guifg=Blue
hi LineNr gui=none guifg=Brown
hi MoreMsg gui=none guifg=SeaGreen
hi NonText gui=none guifg=Blue guibg=grey90
hi Question gui=none guifg=SeaGreen
hi Search gui=none guibg=Yellow guifg=NONE
hi SpecialKey gui=none guifg=Blue
hi Title gui=none guifg=Magenta
hi WarningMsg gui=none guifg=Red
hi WildMenu gui=none guibg=Yellow guifg=Black
hi Folded gui=none guibg=White guifg=DarkBlue
hi FoldColumn gui=none guibg=Grey guifg=DarkBlue

" diff highlights
hi DiffText term=bold cterm=bold ctermfg=red ctermbg=White gui=none guibg=Red
hi DiffAdd term=bold ctermfg=Black ctermbg=White gui=none guibg=LightBlue
hi DiffChange term=bold ctermfg=blue ctermbg=White gui=none guibg=LightMagenta
hi DiffDelete term=bold cterm=bold ctermfg=magenta ctermbg=8 gui=none guifg=Blue guibg=LightCyan

" Colors for syntax highlighting
hi Comment gui=none guifg=#AC2020 guibg=White
hi Constant gui=none guifg=#C28F8F guibg=White
hi PreProc gui=none guifg=#D569D5 guibg=White
hi Statement gui=NONE guifg=#9C20EE guibg=White
hi Type gui=none guifg=#9C20EE guibg=White
hi Special gui=none guifg=SlateBlue guibg=White
hi Ignore gui=none guifg=White

" Some specials (override hilinks)


" vim: sw=2
