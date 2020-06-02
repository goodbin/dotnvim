" ================================================================================
"                                  My NeoVIM settings
"                                  Author: Oleg Lelenkov
" ================================================================================

syntax on	" Подсветка языков

set number	" Включаем номера строк
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

" Включаем 'умные' отступы, например, авто отступ после `{`
set smarttab
set smartindent

" Searching and highlines
set hlsearch	" Подсвечивание результатов поиска
set incsearch	" Поиск в процессе набора
set ignorecase	" умная зависимость от регистра. Детали `:h smartcase`
set smartcase

" Keep more content at the bottom of the buffer
set scrolloff=3
set sidescrolloff=5
set display+=lastline

" Дополнительная информация в строке состояния
set wildmenu
" Показывать положение курсора всё время.
set ruler
" Показывать незавершённые команды в статусбаре
set showcmd
" Отображение парных символов
set showmatch
" Отключаем панели прокрутки в GUI
set guioptions= 
" Отключаем панель табов (окошки FTW)
set showtabline=0 

" Highlight cirsor line
" set cursorline

" Backups off
set nobackup 
set noswapfile
set noundofile

" Кодировка текста по умолчанию utf8
set termencoding=utf8
set encoding=utf-8
" set autoread

" Настройка общего буфера обмена с ОС
" Необходимо установить xsel 
set clipboard+=unnamedplus

" Настройка отображения специальных символов
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+

" Вертикальная черта, рекомендуемая ширина текста в файле
set colorcolumn=100

" Увеличение размера истории
if &history < 1000
  set history=1000
endif

if &tabpagemax < 50
    set tabpagemax=50
endif

"=============НАСТРОЙКИ СВОРАЧИВАНИЯ БЛОКОВ КОДА (фолдинг)=============
set foldenable		" включить фолдинг по умолчанию
set foldmethod=syntax 	" определять блоки на основе синтаксиса файла
" set foldnestmax=3	" deepest fold is 3 levels
" set foldcolumn=3	" показать полосу для управления сворачиванием
set foldlevel=100	" Развернуть все по умолчанию
" set foldopen=all " автоматическое открытие сверток при заходе в них
" :nnoremap <space> za " раскрывать по пробелу


"wrap заставляет переносить строчки без их разделения
"Соответсвенно nowrap рендерит строчки за границами экрана
"Данная вариация работает как wrap  но переносит строчки не посимвольно, а по словам
set wrap linebreak nolist 

" чтение настроек из дитектории .nvimrc
set exrc

if &shell =~# 'fish$' && (v:version < 704 || v:version == 704 && !has('patch276'))
  set shell=/bin/bash
endif

if !empty(&viminfo)
    set viminfo^=!
endif
set sessionoptions-=options

