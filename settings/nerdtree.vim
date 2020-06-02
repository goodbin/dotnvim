" ================================================================================
"                                  My NeoVIM settings
"                                  Author: Oleg Lelenkov
" ================================================================================
" Файловый менеджер / дерево каталогов

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'

map <C-n> :NERDTreeToggle<CR>

let NERDTreeAutoDeleteBuffer = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 0

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

let g:NERDCustomDelimiters = { 'd': { 'left': '//', 'leftAlt': '/**', 'rightAlt': '*/' } }

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Автоматически отобразить NertTree если не указан файл
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

