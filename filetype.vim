" my filetype file
if exists("did_load_filetypes")
	finish
endif

augroup filetypedetect
	au! BufRead,BufNewFile *.cmake         setfiletype cmake
	au! BufRead,BufNewFile *.sav         setfiletype simstate
	au! BufRead,BufNewFile *.simstate         setfiletype simstate
	au! BufRead,BufNewFile indra*log*         setfiletype indralog
	au! BufRead,BufNewFile *newsim*.log.*         setfiletype indralog
	au! BufRead,BufNewFile *-dataserver.log         setfiletype indralog
	au! BufRead,BufNewFile *-log-dataserver.log         setfiletype indralog
	au! BufRead,BufNewFile *-newspace.log         setfiletype indralog
	au! BufRead,BufNewFile *-userserver.log         setfiletype indralog
	au BufNewFile,BufRead *.i set filetype=swig 
	au BufNewFile,BufRead *.swg set filetype=swig 
	au BufNewFile,BufRead *.swigcxx set filetype=swig 
	au BufNewFile,BufRead *.targets set filetype=xml
    au BufNewFile,BufRead .sharedrc set filetype=sh
	"au! BufRead,BufNewFile *.xyz          setfiletype drawing
augroup END

