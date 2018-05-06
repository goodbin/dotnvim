" ================================================================================
"                                  My NeoVIM settings
"                                  Author: Oleg Lelenkov
" ================================================================================

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark
let g:gruvbox_invert_signs=0
let g:gruvbox_sign_column='dark0'
colorscheme gruvbox

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
  set t_Co=16
endif
