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

Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }     " Автокомплит

Plug 'SirVer/ultisnips'                                         " Сниппеты
Plug 'kiith-sa/DSnips'

Plug 'morhetz/gruvbox'                                          " Цветовая схема

Plug 'lyokha/vim-xkbswitch'                                     " Автоматическое переключение раскладки

" Поддержка языков
Plug 'mustache/vim-mustache-handlebars'                         
call plug#end()
filetype plugin indent on
