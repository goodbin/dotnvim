" ================================================================================
"                                  My NeoVIM settings
"                                  Author: Oleg Lelenkov
" ================================================================================

" Set theme
let g:airline_theme = 'gruvbox'
" Show airline with single file
set laststatus=2
" Use powerline font
let g:airline_powerline_fonts = 1
let g:Powerline_symbols='unicode' "Поддержка unicode
" Customzation
let g:airline#extensions#tabline#enabled = 0    " Enable tabline
let g:airline#extensions#keymap#enabled  = 0    "Не показывать текущий маппинг
let g:airline#extensions#xkbswitch#enabled = 1  "Поддержка xkblayout
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline_section_z = "\ue0a1:%l/%L Col:%c" "Кастомная графа положения курсора

