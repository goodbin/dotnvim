" ================================================================================
"                                  My NeoVIM settings
"                                  Author: Oleg Lelenkov
" ================================================================================

syntax on

" Default Whitespace
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set cindent
set smartindent
set autoindent

set number

" Searching and highlines
set hlsearch
set incsearch
set ignorecase
set smartcase

" Keep more content at the bottom of the buffer
set scrolloff=5

" Highlight cirsor line
set cursorline

set nobackup 
set noswapfile

set encoding=utf-8

" Настройка общего буфера обмена с ОС
" Необходимо установить xsel 
set clipboard+=unnamedplus

"=============НАСТРОЙКИ СВОРАЧИВАНИЯ БЛОКОВ КОДА (фолдинг)=============
" set foldenable " отклключить фолдинг по умолчанию
set foldmethod=syntax " определять блоки на основе синтаксиса файла
" set foldnestmax=3       "deepest fold is 3 levels
set foldcolumn=3 " показать полосу для управления сворачиванием
" set foldlevel=1 " Первый уровень вложенности открыт, остальные закрыты
" set foldopen=all " автоматическое открытие сверток при заходе в них

:nnoremap <space> za


" Auto-Save
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0
 
set exrc

