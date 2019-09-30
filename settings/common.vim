" ================================================================================
"                                  My NeoVIM settings
"                                  Author: Oleg Lelenkov
" ================================================================================

filetype plugin indent on
syntax enable

set number
set ttimeout
set ttimeoutlen=100

" Default Whitespace
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set cindent
set autoindent
set backspace=indent,eol,start
set complete-=i

set smarttab
set smartindent

" Searching and highlines
" set hlsearch
set incsearch
" set ignorecase
" set smartcase

" Keep more content at the bottom of the buffer
set scrolloff=5
set wildmenu
set ruler
set scrolloff=1
set sidescrolloff=5
set display+=lastline

" Highlight cirsor line
set cursorline

set nobackup 
set noswapfile
set noundofile

set encoding=utf-8
set autoread

" Настройка общего буфера обмена с ОС
" Необходимо установить xsel 
set clipboard+=unnamedplus

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

if &shell =~# 'fish$' && (v:version < 704 || v:version == 704 && !has('patch276'))
  set shell=/bin/bash
endif

if &history < 1000
  set history=1000
endif

if &tabpagemax < 50
  set tabpagemax=50
endif

if !empty(&viminfo)
  set viminfo^=!
endif
set sessionoptions-=options

"=============НАСТРОЙКИ СВОРАЧИВАНИЯ БЛОКОВ КОДА (фолдинг)=============
set foldenable " включить фолдинг по умолчанию
set foldmethod=syntax " определять блоки на основе синтаксиса файла
" set foldnestmax=3       "deepest fold is 3 levels
" set foldcolumn=3 " показать полосу для управления сворачиванием
" set foldlevel=1 " Первый уровень вложенности открыт, остальные закрыты
" set foldopen=all " автоматическое открытие сверток при заходе в них

:nnoremap <space> za

" Auto-Save
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0

set colorcolumn=120

set guioptions= "Отключаем панели прокрутки в GUI
set showtabline=0 "Отключаем панель табов (окошки FTW)

"wrap заставляет переносить строчки без их разделения
"Соответсвенно nowrap рендерит строчки за границами экрана
set wrap linebreak nolist "Данная вариация работает как wrap  но переносит строчки не посимвольно, а по словам

set exrc

