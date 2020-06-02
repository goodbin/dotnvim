" ================================================================================
"                                  Prelum NeoVIM syntax
"                                  Author: Oleg Lelenkov
" ================================================================================

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

syn match	preParam		"[^,)(\s]*" contained
syn region	preParen		start="(" end=")" keepend contained contains=preParam
syn match	preKeyword		"^\(\S\|(\)\{-}\ze\(\s\|(\)" contained
syn match	preEndCompound		"^--\s*$" contained

syn match	preParagraphPlain	"^\(\S\|(\)\{-}\s*(.*$" contains=preKeyword,preParen
syn match	preParagraphSymbol	"^[)=+]*\(\s\|(\).*$" contains=preKeyword

syn region	preParagraphCompound	start="^документ\s*(" end="^--\s*$" keepend contains=preEndCompound,preParagraphPlain
syn region	preParagraphCompound	start="^схема\s*(" end="^--\s*$" keepend contains=preEndCompound,preParagraphPlain

syn match	preComment		"^#.*$"


" The default highlighting.
"
hi def link preComment		Comment
hi def link preKeyword		Keyword
hi def link preParen 		Special
hi def link preParam 		Identifier
hi def link preEndCompound	Special

let b:current_syntax = "prelum"
