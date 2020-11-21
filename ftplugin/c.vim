" Vim filetype plugin file
" Language:	C
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last Change:	2002 Feb 18

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif

" Don't load another plugin for this buffer
let b:did_ftplugin = 1

setlocal cindent

" Set 'formatoptions' to break comment lines but not other lines,
" and insert the comment leader when hitting <CR> or using "o".
setlocal fo-=tcro fo+=qln

" Set 'comments' to format dashed lists in comments.
setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://

" In VMS C keywords contain '$' characters.
if has("vms")
  setlocal iskeyword+=$
endif

set cpo-=C

" Win32 can filter files in the browse dialog
if has("gui_win32") && !exists("b:browsefilter")
  if &ft == "cpp"
    let b:browsefilter = "C++ Source Files (*.cpp *.c++)\t*.cpp;*.c++\n" .
	\ "C Header Files (*.h)\t*.h\n" .
	\ "C Source Files (*.c)\t*.c\n" .
	\ "All Files (*.*)\t*.*\n"
  else
    let b:browsefilter = "C Source Files (*.c)\t*.c\n" .
	\ "C Header Files (*.h)\t*.h\n" .
	\ "C++ Source Files (*.cpp *.c++)\t*.cpp;*.c++\n" .
	\ "All Files (*.*)\t*.*\n"
  endif
endif