" ================================================================================
"                                  My NeoVIM settings
"                                  Author: Oleg Lelenkov
" ================================================================================
" Цветовая схема

Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'

if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
endif

set background=dark
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='hard'
" let g:gruvbox_invert_signs=0
" let g:gruvbox_sign_column='dark0'

