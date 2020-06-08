" ================================================================================
"                                  My NeoVIM settings
"                                  Author: Oleg Lelenkov
" ================================================================================

let g:XkbSwitchEnabled = 1
let g:XkbSwitchIMappings = ['ru']

set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0

" Learn it the hard way
nmap <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

let g:mapleader=','

" Отключаем переход в Ex mode
map Q <Nop>

map <silent> <C-h> :lua functions.WinMove('h')<CR>
map <silent> <C-j> :lua functions.WinMove('j')<CR>
map <silent> <C-k> :lua functions.WinMove('k')<CR>
map <silent> <C-l> :lua functions.WinMove('l')<CR>

