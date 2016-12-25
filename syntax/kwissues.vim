if exists("b:current_syntax")
    finish
endif

syntax case match

syntax match kwIssuesCode "^\s*[A-Z.]\+" nextgroup=kwIssuesId skipwhite
syntax match kwIssuesId "\s\d\+" nextgroup=kwIssuesStatus skipwhite contained
syntax match kwIssuesStatus "\s[ a-zA-Z]\+\ze:" nextgroup=kwIssuesMessage skipwhite contained

syntax region kwIssuesMessage start="\S" end="$" skipwhite contained keepend contains=kwIssuesLines,kwIssuesQuoted,@Spell
syntax region kwIssuesQuoted start="'" end="'" contained
syntax region kwIssuesLines start="line" end="\." contained contains=kwIssuesLineNumber

highlight default link kwIssuesCode Identifier
highlight default link kwIssuesId Number
highlight default link kwIssuesStatus Type
highlight default link kwIssuesMessage Comment
highlight default link kwIssuesQuoted String
highlight default link kwIssuesLines Statement

let b:current_syntax = "kwissues"
