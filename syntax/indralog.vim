" Vim syntax file
" Language:	indralog state file
" Maintainer:	Donald Kjer <log@lindenlab.com>
" Last Change:	2006 Dec 13
"

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
    syn clear
elseif exists("b:current_syntax")
    finish
endif

" indra.log files are case sensitive
syn case match


"syn match indraURL |http\(s\)\?:\/\/[\w\.]\+\(\/\)\+\S*|
syn match indraURL |http\(s\)\?:\/\/[0-9A-Za-z_\.:]\+[\/0-9A-Za-z%_\?\&\+\-\.]*|
syn match indraPath |\s\(\/[<>0-9A-Za-z%_\?\&\+\-\.]\+\)\+|
syn match indraIPPORT |\<\d\{1,3\}\.\d\{1,3\}\.\d\{1,3\}\.\d\{1,3\}\(:\d\+\)\?\>|
syn match indraUUID |\x\{8\}-\x\{4\}-\x\{4\}-\x\{4\}-\x\{12\}\>|
syn keyword indraSTAT STAT1 STAT2 STAT3 STAT4 STAT5 STAT6 STAT7 STAT8
syn match indraChat |^.*INFO: Chat 1.*$|

syn match indraValgrind /^==.*$/
syn match indraDEBUG /^.*DEBUG.*$/ contains=indraURL,indraIPPORT,indraUUID,indraPath
syn match indraWARNING /^.*WARNING.*$/ contains=indraURL,indraIPPORT,indraUUID,indraPath
syn match indraERROR /^.*ERROR.*$/ contains=indraURL,indraIPPORT,indraUUID,indraPath

if version >= 508 || !exists("did_config_syntax_inits")
  if version < 508
    let did_config_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

" the assume use three we have six non-standard colors at our disposal
"   Comment 
"   Constant
"   Special 
"   Keyword 
"   Identifier 
"   Structure

HiLink indraValgrind Comment
HiLink indraDEBUG StorageClass
HiLink indraWARNING Special
HiLink indraERROR Error
HiLink indraSTAT Keyword

HiLink indraURL Underlined
HiLink indraPath Macro
HiLink indraIPPORT Number
HiLink indraUUID Number
"HiLink indraHTML Constant
HiLink indraChat Function

"  HiLink indraComment Comment

"  HiLink indraTask Keyword
"  HiLink indraUUID Number
"  HiLink indraMask Number
"
"  HiLink indraHeader Special
"  HiLink indraRegion StorageClass
"  HiLink indraParcel StorageClass
"  HiLink indraFlag Special
"  HiLink indraTexture StorageClass
"  HiLink indraLayer Special
"  HiLink indraDwell Special
"  HiLink indraTelehub Special
"  HiLink indraPermissions Keyword
"  HiLink indraMaskName Special
"  HiLink indraOwner Identifier
"
"  HiLink indraShape Keyword
"  HiLink indraImage Keyword
"  HiLink indraSaleInfo Keyword
"
"  HiLink indraTaskName Special
"  HiLink indraPreLink Special
"  HiLink indraLinkInfo Special
"
"  HiLink indraPath Keyword
"  HiLink indraProfile Identifier

  delcommand HiLink
endif

let b:current_syntax = "indralog"
" vim: sts=4 sw=4 ts=8

