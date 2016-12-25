if exists("b:current_syntax")
    finish
endif

syntax case match

syntax match kwIssuesCode "^\s*[A-Z.]\+" nextgroup=kwIssuesId skipwhite
syntax match kwIssuesId "\s\d\+" nextgroup=kwIssuesStatus skipwhite contained
syntax match kwIssuesStatus "\s[ a-zA-Z]\+\ze:" nextgroup=kwIssuesMessage skipwhite contained

syntax region kwIssuesMessage start="\S" end="$" skipwhite contained keepend contains=kwIssuesQuoted contains=kwIssuesLines contains=@Spell
syntax match kwIssuesQuoted "'[^']\{-}'" contained
syntax region kwIssuesLines start="lines\?" skip="," end="." contained

highlight default link kwIssuesCode Identifier
highlight default link kwIssuesId Number
highlight default link kwIssuesStatus Type
highlight default link kwIssuesMessage Comment
highlight default link kwIssuesQuoted String

let b:current_syntax = "kwissues"
