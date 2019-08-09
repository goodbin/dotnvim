" ================================================================================
"                                  My NeoVIM settings
"                                  Author: Oleg Lelenkov
" ================================================================================

if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif

  " if (has("termguicolors"))
  "   set termguicolors
  " endif
endif

set background=dark
let g:gruvbox_invert_signs=0
let g:gruvbox_sign_column='dark0'
colorscheme gruvbox

