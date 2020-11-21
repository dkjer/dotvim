" some utility functions for working with two linden sandboxes

"--------------------------------------------------------------------
" Bdiff = diff this file with the counterpart in the other sandbox
"--------------------------------------------------------------------

if exists("loaded_branchdiff")
	finish
endif
let loaded_branchdiff = 1


" PRIVATE
" returns CWD - $HOME
function! <SID>GetSandBox()
	let sandBox = expand("%:p:h")
	if (match(sandBox, $HOME) == 0)
		let homeLen = strlen($HOME)
		let sandLen = strlen(sandBox) - homeLen
		let sandBox = strpart(sandBox, homeLen, sandLen)
	endif
	"debug echo "GetSandBox = " . sandBox
	return sandBox
endfunction


" PRIVATE
" returns /branch/(CWD - $HOME) if we're currently in the trunk
" or (CWD - $HOME - /branch) if we're currently in the branch
function! <SID>GetOtherSandBox()
	let sandBox = <SID>GetSandBox()
	if (match(sandBox, "/branch") == 0)
		let otherLen = strlen(sandBox) - 7
		let otherSandBox = strpart(sandBox, 7, otherLen)
	else
		let otherSandBox = "/branch" . sandBox
	endif
	"debug echo "GetOtherSandBox = " . otherSandBox
	return otherSandBox
endfunction


" vertically diffsplits the screen with the corresponding file
" from the other linden branch (if found)
function! BranchDiff()
	let fileName = expand("%:t") 
	let otherSandBox = <SID>GetOtherSandBox()
	if (otherSandBox != "")
		let otherFile = $HOME . otherSandBox . "/" . fileName
		"if (bufexists(otherFile))
		"	" goto the buffer
		"	echo "foo"
		"else
		if (filereadable(otherFile))
			" vdiffsplit with other file
			silent! execute ":vert diffsplit " otherFile
		endif
	else
		echo "couldn't find other branch"
	endif
endfunction


" vertically splits the screen with the corresponding file
" from the other linden branch (if found)
function! BranchSplit()
	let fileName = expand("%:t") 
	let otherSandBox = <SID>GetOtherSandBox()
	if (otherSandBox != "")
		let otherFile = $HOME . otherSandBox . "/" . fileName
		"if (bufexists(otherFile))
		"	" goto the buffer
		"	echo "foo"
		"else
		if (filereadable(otherFile))
			" vsplit with other file
			silent! execute ":vert split " otherFile
		endif
	else
		echo "couldn't find other branch"
	endif
endfunction


comm! Bdiff call BranchDiff()
comm! Bvsplit call BranchSplit()
