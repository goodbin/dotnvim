" ================================================================================
"                                  My NeoVIM settings
"                                  Author: Oleg Lelenkov
" ================================================================================

" Dlang
Plug 'JesseKPhillips/d.vim'

" Off autosave for OpenSCAD
autocmd BufReadPre,FileReadPre *.scad :let g:auto_save = 0

au BufRead,BufNewFile *.pre set filetype=prelum

