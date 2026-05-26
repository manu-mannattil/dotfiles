" Vim syntax file
" Language: soclog text

if exists("b:current_syntax")
  finish
endif

" Fancy headings.
syntax match SocLogDash /—/

" question: Q:
syntax match SocLogQ /^\s*Q:/

" Sentence inside brackets
syntax region SocLogTitle
      \ start=/\[/
      \ end=/\]/
      \ contains=NONE
      \ keepend

highlight def link SocLogDash Type
highlight def link SocLogTitle Exception
highlight def link SocLogQ Number

let b:current_syntax = "soclog"
