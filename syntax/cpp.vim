" Vim syntax file -- andrew's custom C++ syntax for Linden Lab
" Language:	C++
" Maintainer:	Andrew Meadows andrew@lindenlab.com
" Last change:	2003.07.10

" Read the base C++ syntax to start with
let c_gnu=1
runtime! $VIMRUNTIME/syntax/cpp.vim

" syn keyword	cStorageClass	inline __attribute__
" syn match cppFuncDef "::\~\?\zs\h\w*\ze([^)]*\()\s*\(const\)\?\)\?$"
" hi def link cppFuncDef Special

" Highlight Class and Function names
syn match    cCustomParen    "?=(" contains=cParen,cCppParen
syn match    cCustomFunc     "\w\+\s*(\@=" contains=cCustomParen
syn match    cCustomScope    "::"
syn match    cCustomClass    "\w\+\s*::" contains=cCustomScope
" hi def cCustomFunc  gui=bold guifg=yellowgreen
hi def link cCustomClass Constant


" Linden Lab syntax
syn keyword cppType			U64 U32 U16 U8
syn keyword cppType			S64 S32 S16 S8
syn keyword cppType			F32 F64
syn keyword cppType			BOOL
syn keyword cppType			ostream istream 
syn keyword cppType         int32 int64 uint32 uint64 mem_int mem_uint byte
syn keyword cppBoolean		TRUE FALSE
syn keyword cppStatement 	llinfos llwarns lldebugs llerrs llendl llcont

" Andrew's special comment keywords
syn keyword cTodo 			contained adebug leviathan Leviathan



