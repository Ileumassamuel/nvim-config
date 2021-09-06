" Vim syntax file
" Add checkboxes to *.md files

" Custom conceal
syntax match todoCheckbox "\[\ \]" conceal cchar=
syntax match todoCheckbox "\[x\]" conceal cchar=

hi def link todoCheckbox Todo

highlight Conceal ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE

setlocal conceallevel=1
setlocal concealcursor=
