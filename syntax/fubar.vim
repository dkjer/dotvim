" Vim syntax highlighting check
" Language:	
" Maintainer:	Andrew Meadows <andrew@lindenlab.com>
" Last Change:	2004 May 1
"

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
    syn clear
elseif exists("b:current_syntax")
    finish
endif

" simstate files are case sensitive
syn case match

syn match fuBoolean /^Boolean/
syn match fuCharacter /^Character/
syn match fuComment /^Comment/
syn match fuConditional /^Conditional/
syn match fuConstant /^Constant/
syn match fuDebug /^Debug/
syn match fuDelimiter /^Delimiter/
syn match fuError /^Error/
syn match fuException /^Exception/
syn match fuFloat /^Float/
syn match fuFunction /^Function/
syn match fuIdentifier /^Identifier/
syn match fuInclude /^Include/
syn match fuKeyword /^Keyword/
syn match fuLabel /^Label/
syn match fuMacro /^Macro/
syn match fuNumber /^Number/
syn match fuOperator /^Operator/
syn match fuPreCondit /^PreCondit/
syn match fuPreProc /^PreProc/
syn match fuRepeat /^Repeat/
syn match fuSpecial /^Special/
syn match fuSpecialChar /^SpecialChar/
syn match fuSpecialComment /^SpecialComment/
syn match fuStatement /^Statement/
syn match fuStorageClass /^StorageClass/
syn match fuString /^String/
syn match fuStructure /^Structure/
syn match fuTag /^Tag/
syn match fuTodo /^Todo/
syn match fuType /^Type/
syn match fuTypedef /^Typedef/

if version >= 508 || !exists("did_config_syntax_inits")
  if version < 508
    let did_config_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink fuBoolean Boolean
  HiLink fuCharacter Character
  HiLink fuComment Comment
  HiLink fuConstant Constant
  HiLink fuDebug Debug
  HiLink fuDefine Define
  HiLink fuDelimiter Delimiter
  HiLink fuError Error
  HiLink fuException Exception
  HiLink fuFloat Float
  HiLink fuFunction Function
  HiLink fuIdentifier Identifier
  HiLink fuInclude Include
  HiLink fuKeyword Keyword
  HiLink fuLabel Label
  HiLink fuMacro Macro
  HiLink fuNumber Number
  HiLink fuOperator Operator
  HiLink fuPreCondit PreCondit
  HiLink fuPreProc PreProc
  HiLink fuRepeat Repeat
  HiLink fuSpecial Special
  HiLink fuSpecialChar SpecialChar
  HiLink fuSpecialComment SpecialComment
  HiLink fuStatement Statement
  HiLink fuStorageClass StorageClass
  HiLink fuString String
  HiLink fuStructure Structure
  HiLink fuTag Tag
  HiLink fuTodo Todo
  HiLink fuType Type
  HiLink fuTypedef Typedef

  delcommand HiLink
endif

let b:current_syntax = "fubar"
" vim: sts=4 sw=4 ts=8
