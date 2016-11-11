" ================================================================================
"                                  My NeoVIM VIM-Plug
"                                  Author: Oleg Lelenkov
" ================================================================================

function! DoRemote(arg)
    UpdateRemotePlugins
endfunction

filetype off
call plug#begin()

Plug 'vim-airline/vim-airline'                                  " Статусная строка 
Plug 'vim-airline/vim-airline-themes'                           " Темы для статустой строки 

Plug 'airblade/vim-gitgutter'                                   " Подсветка измененных строк по версии git

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeFocus' }          " Файловый менеджер / дерево каталогов
Plug 'scrooloose/nerdcommenter'

Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }     " Автокомплит

Plug 'SirVer/ultisnips'                                         " Сниппеты
Plug 'honza/vim-snippets'
Plug 'kiith-sa/DSnips'

Plug 'morhetz/gruvbox'                                          " Цветовая схема

Plug 'lyokha/vim-xkbswitch'                                     " Автоматическое переключение раскладки

Plug 'vim-scripts/vim-auto-save'                                " автоматическое сохранение

" Поддержка языков
Plug 'mustache/vim-mustache-handlebars'                         

Plug 'JesseKPhillips/d.vim'

Plug 'Bashka/vim_lib'
Plug 'Bashka/vim_prj'
Plug 'Bashka/vim_template'                                      " шаблоны файлов

Plug 'leafgarland/typescript-vim'

Plug 'posva/vim-vue'

call plug#end()
filetype plugin indent on
filetype plugin on
