" ================================================================================
"                                  My NeoVIM settings
"                                  Author: Oleg Lelenkov
" ================================================================================

set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0

"" Learn it the hard way
nmap <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

let g:mapleader=','

map <silent> <C-h> :call WinMove('h')<CR>
map <silent> <C-j> :call WinMove('j')<CR>
map <silent> <C-k> :call WinMove('k')<CR>
map <silent> <C-l> :call WinMove('l')<CR>

let g:XkbSwitchEnabled = 1
let g:XkbSwitchIMappings = ['ru']
