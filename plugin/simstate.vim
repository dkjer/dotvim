" simstate.vim
"
" vim plugin with some utility functions for working with simstate files
" (look at bottom of file for quick synopsis (via command! declarations)
" of the functions available)
"
" Note -- a side effect of using this plugin is that it will override
" some marks, however all of them are capital marks (like B, T, O, and Q)

if exists("loaded_simstate")
	finish
endif
let loaded_simstate = 1


" navigate up to the previous top-of-task 
function! PreviousTask()
	return search('^task\s*\x\{8}-\x\{4}-\x\{4}-\x\{4}-\x\{12}', 'bW')
endfunction


" navigate down to the next top-of-task
function! NextTask()
	return search('^task\s*\x\{8}-\x\{4}-\x\{4}-\x\{4}-\x\{12}', 'W')
endfunction


" navigate up to previous linked object closure 
function! PreviousLinkClosure()
	"?^\s*pre_link_base_mask\s\x\{8}\n^}\|^\s*pre_link_base_mask\s\x\{8}\n^\slinked\s*linked\n^} 

	" hunt for the first variety of closure
	let cp = line(".")
	let foo = search('^\s*pre_link_base_mask\s\x\{8}\n^}', 'bW')

	" go back and hunt again for the second variety
	call cursor(cp, 1)
	let bar = search('^\s*pre_link_base_mask\s\x\{8}\n^\slinked\s*linked\n^}', 'bW') 

	" use the closest closure
	if (foo > bar)
		call cursor(foo, 1)
		let bar = foo
	endif

	" mark the closure
	if (bar != 0)
		mark U
	endif

	return bar
endfunction


" navigate down to the next link closure 
function! NextLinkClosure()
	"/^\s*pre_link_base_mask\s\x\{8}\n^}\|^\s*pre_link_base_mask\s\x\{8}\n^\slinked\s*linked\n^} 
	" hunt for first variety of closure
	let cp = line(".")
	let foo = search('^\s*pre_link_base_mask\s\x\{8}\n^}', 'W')

	" go back and hunt again for the other variety of closure
	call cursor(cp, 1)
	let bar = search('^\s*pre_link_base_mask\s\x\{8}\n^\slinked\s*linked\n^}', 'W')

	" use the nearest closure
	if (foo != 0 && foo < bar)
		call cursor(foo, 1)
		let bar = foo
	endif

	" mark the closure
	if (foo != 0)
		mark D
	endif

	return bar
endfunction


" navigate to the top of the task under the cursor
function! TopOfTask()
	let this_line = getline(".")
	let bar = line(".")
	if this_line !~ '^task\s*\x\{8}-\x\{4}-\x\{4}-\x\{4}-\x\{12}'
		let bar = PreviousTask()
	endif

	if (bar != 0)
		mark T
	endif

	return bar
endfunction


" navigate to the bottom of the task under the cursor
function! BottomOfTask()
	let current_line_number = line(".")
	let bar = TopOfTask()
	if (bar == 0)
		return 0
	endif

	" task has a top ==> look for opening brace
	let top_of_task = line(".")
	call cursor(top_of_task + 1, 1)
	let first_task_line = getline(".")
	if first_task_line !~ '^{'
		echo "This task is missing its open brace." 
		call cursor(current_line_number, 1)
		return 0
	endif

	" task looks valid ==> look for closing brace
	let end_of_task = search('^}', 'W')
	if (end_of_task == 0)
		echo "This task is missing its closing brace."
		call cursor(current_line_number, 1)
		return 0
	endif

	" task looks good ==> mark it
	mark B
	return end_of_task
endfunction


" navigate to the top of the linked object under the cursor
function! TopOfObject()
	let top_of_task = TopOfTask()
	if (top_of_task == 0)
		return 0
	endif

	let next_closure = PreviousLinkClosure()
	if (next_closure == 0)
		" This is the first object.  Go to the
		" top of the file and find the first task.
		call cursor(1, 1)
	endif

	let top_of_object = NextTask()
	if (top_of_object == 0)
		call cursor(top_of_task, 1)
		mark O
		return top_of_task
	endif

	mark O
	return top_of_object
endfunction


" navigate to the bottom of the linked object under the cursor
function! BottomOfObject()
	let current_line = line(".")
	if (TopOfTask() == 0)
		return 0
	endif

	if (NextLinkClosure() == 0)
		call cursor(current_line, 1)
		return 0
	endif

	let bottom_of_task = BottomOfTask()
	if (bottom_of_task == 0)
		return 0
	endif

	mark Q
	return bottom_of_task
endfunction


" yank object under the cursor into the default buffer
function! YankObject()
	let current_line = line(".")
	let top_of_this_object  = TopOfObject()
	if (top_of_this_object == 0)
		echo "Could not yank this object -- no top"
		return 0
	endif

	let bottom_of_this_object = BottomOfObject()
	if (bottom_of_this_object == 0)
		echo "Could not yank this object -- no bottom"
		return 0
	endif

	call cursor(current_line, 1)
	'O,'Q yank 
	return 1
endfunction


" delete the object under the cursor
function! DeleteObject()
	let current_line = line(".")
	let top_of_this_object  = TopOfObject()
	if (top_of_this_object == 0)
		echo "Could not yank this object -- no top"
		return 0
	endif

	let bottom_of_this_object = BottomOfObject()
	if (bottom_of_this_object == 0)
		echo "Could not yank this object -- no bottom"
		return 0
	endif

	call cursor(current_line, 1)
	'O,'Q delete
	return 1
endfunction

" Fold up a block with the given start/end strings
function! FoldBlock(start, end, ...)
	" See if we need to not fold up past a certain limit
	let limit = 0
	if a:0 > 0
		let limit = a:1
	endif
		
	let search_start = search(a:start, 'W')
	if (search_start == 0)
		return 0
	endif
	mark i

	let search_end   = search(a:end,   'W')
	if (search_start == 0)
		return 0
	endif
	mark j

	" If we have a limit, make sure we aren't extending beyond it.
	if ( limit != 0 && ( search_start > limit || search_end > limit ) )
		return 0
	endif
	
	" Everything is valid, fold the block
	'i,'j fold
	return 1
endfunction


" fold up the current task
function! FoldTask()
	let top_of_this_task = TopOfTask()
	if (top_of_this_task == 0)
		echo "Could not fold this task -- no top"
		return 0
	endif

	let bottom_of_this_task = BottomOfTask()
	if (bottom_of_this_task == 0)
		echo "Count not fold this task -- no bottom"
		return 0
	endif
	
	" Fold up the whole task.
	'T,'B fold

	let g:tasks_loaded = g:tasks_loaded + 1
	if (g:tasks_loaded % 1000 == 0)
		echo "Loaded " g:tasks_loaded " tasks."
	endif

	" call cursor(bottom_of_this_task, 1)
	return 1
endfunction

" fold up the current object
function! FoldObject()
	let top_of_this_object = TopOfObject()
	if (top_of_this_object == 0)
		echo "Could not fold this object -- no top"
		return 0
	endif

	let bottom_of_this_object = BottomOfObject()
	if (bottom_of_this_object == 0)
		echo "Could not fold this object -- no bottom"
		return 0
	endif

	" Move back to the first task in the object, and fold up each task.
	call cursor(top_of_this_object, 1)
	call FoldTask()
	let next_task = NextTask()
	while (next_task != 0 && next_task < bottom_of_this_object)
		call FoldTask()
		let next_task = NextTask()
	endwhile

	" Fold up the whole object.
	'O,'Q fold
	return next_task
endfunction

function! SimFoldText()
	let originalLine = getline(v:foldstart)
	let line = substitute(originalLine, '\_^\t*', '', '')
	let prefix = strpart('                                    ', 0, (4 * (v:foldlevel - 1)))
	let line = prefix . line
	
	" Check for a task name
	let task_name = getline(v:foldstart + 14)
	if (task_name =~ '^\s*name')
		let task_name = substitute(task_name, '^\s*name\s*', '', '')
		let task_name = substitute(task_name, '|$', '', '')
		let line = line . " '" . task_name . "'"
		return line
	endif

	" Check for a task name
	let task_name = getline(v:foldstart + 2)
	if (task_name =~ '^\s*name')
		let task_name = substitute(task_name, '^\s*name\s*', '', '')
		let task_name = substitute(task_name, '|$', '', '')
		let line = line . " '" . task_name . "'"
		return line
	endif

	" Check for a content object name
	let task_name = getline(v:foldstart + 25)
	if (task_name =~ '^\s*name')
		let task_name = substitute(task_name, '^\s*name\s*', '', '')
		let task_name = substitute(task_name, '|$', '', '')
		let line = line . " '" . task_name . "'"
		return line
	endif
	
	return line
endfunction

function! FoldBlockWithHeader(header)
	" Search for the header.
	let header_line = search(a:header, 'W')
	if (header_line == 0)
		return 0
	endif
	mark i

	" Loop through all consecutive blocks.
	let done = 0
	let found = 0
	while (done == 0)
		" Move to the next line, and see if it contains a '{'
		let next_line = line(".") + 1
		call cursor(next_line, 1000)
		let line_contents = getline(".")
		" Is the last character not a brace?
		if line_contents !~ '{$'
			" We are done checking for blocks.
			let done = 1
			" Move back one line
			call cursor(next_line - 1, 1)
		else
			" We found at least one block
			let found =1 
			" Move to the matching brace
			execute "normal %"
			mark j
		endif
	endwhile

	" Did we find a block?
	if (found == 0)
		" No, return.
		return 1
	endif

	" 	Fold the block
	'i,'j fold
	return 1
endfunction

" Fold up blocks that don't contain other blocks.
function! FoldAtomic()
	echo "Loading Atomic Blocks..."
	call FoldBlock('^texturebase\s*0', '^textureheightrange\s*3')
	while FoldBlock('^layer\s', '^}')
	endwhile
	call FoldBlock('^parcels', '^}')
	call FoldBlock('^dwell', '^}')
	call FoldBlock('^telehub', '^}')

	" We will need to make multiple passes over the tasks.  Save the top of the task.
	let top_task = NextTask()
	while FoldBlock('^\s*permissions', '^\s*}')
	endwhile
	call cursor(top_task, 1)
	while FoldBlock('^\s*sale_info', '^\s*}')
	endwhile
	call cursor(top_task, 1)
	while FoldBlock('^\s*local_id', '^\s*sandboxhome')
	endwhile
	call cursor(top_task, 1)
	while FoldBlock('^\s*lsl_state_data', '$\n^\s*lsl_bytecode_data')
	endwhile
	call cursor(top_task, 1)
	while FoldBlock('^\s*lsl_bytecode_data', '$\n^\s*lsl_sensor_delay_time')
	endwhile
	call cursor(top_task, 1)
	while FoldBlock('^\s*ps_next_crc', '}\n\s*ip\s')
	endwhile
	call cursor(top_task, 1)
	while FoldBlockWithHeader('^\s*particle_system')
	endwhile
	call cursor(top_task, 1)
	while FoldBlockWithHeader('^\s*shape')
	endwhile
	call cursor(top_task, 1)
	while FoldBlockWithHeader('^\s*inv_item')
	endwhile
	call cursor(top_task, 1)
	while FoldBlockWithHeader('^\s*faces')
	endwhile
	call cursor(top_task, 1)
endfunction

" fold up all objects in the buffer
function! FoldObjects()
	echo "Loading tasks..."
	mark k

	let g:tasks_loaded = 0
	while FoldObject()
	endwhile
	echo g:tasks_loaded " tasks loaded."

	call BottomOfTask()
	mark l

	" Fold up all tasks.
	'k,'l fold
	return 1
endfunction

" Fold up the whole sim.
function! FoldSim()
	" Save our starting line, so we can restore it later.
	let current_line = line(".")
	" Move to the top of the buffer.
	call cursor(1,1)

	set foldtext=SimFoldText()
	" Fold up atomic blocks first.
	call FoldAtomic()
	" Then fold up all objects, task-by-task.
	call FoldObjects()

	" Restore the original cursor position.
	call cursor(current_line, 1)
endfunction

" declare some shortcut commands
" to execute the shortcut 'Foo' use ':Foo' when in command-mode
comm! TTask call TopOfTask()
comm! BTask call BottomOfTask()
comm! TObject call TopOfObject()
comm! BObject call BottomOfObject()
comm! YObject call YankObject()
comm! DObject call DeleteObject()
comm! FObjects call FoldObjects()
comm! FObject call FoldObject()
comm! FSim call FoldSim()

" Some functions yet to be written:
"
" MoveNameToTop() -- moves the task name to top of task structure
" CountSubTasks() -- counts the tasks in object under cursor
" CountAllTasks() -- counts all the tasks in the file
" YankParcel() -- yanks all objects in a particular parcel to standard buffer
" DeleteFish() -- deletes objects by name, owner, script_id, or other info
" DeleteAliens() -- deletes all objects NOT owned by particular user
" DeleteUniques() -- deletes all objects that are unique

