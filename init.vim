" ================================================================================
"                                  My NeoVIM settings
"                                  Author: Oleg Lelenkov
" ================================================================================

filetype off
call plug#begin()

Plug 'morhetz/gruvbox'                                          " Цветовая схема

Plug 'vim-airline/vim-airline'                                  " Статусная строка
Plug 'vim-airline/vim-airline-themes'                           " Темы для статустой строки

Plug 'vim-scripts/vim-auto-save'                                " автоматическое сохранение

Plug 'SirVer/ultisnips'                                         " Сниппеты
Plug 'honza/vim-snippets'
Plug 'kiith-sa/DSnips'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeFocus' }          " Файловый менеджер / дерево каталогов
Plug 'scrooloose/nerdcommenter'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }     " Автокомплит

Plug 'airblade/vim-gitgutter'                                   " Подсветка измененных строк по версии git
Plug 'lyokha/vim-xkbswitch'                                     " Автоматическое переключение раскладки

Plug 'Bashka/vim_lib'
Plug 'Bashka/vim_prj'
Plug 'Bashka/vim_template'                                      " шаблоны файлов

call plug#end()
filetype plugin indent on
filetype plugin on


source $HOME/.config/nvim/settings/theme.vim
source $HOME/.config/nvim/settings/common.vim
source $HOME/.config/nvim/settings/keymapping.vim
source $HOME/.config/nvim/settings/nerdtree.vim
source $HOME/.config/nvim/settings/nerdcommenter.vim

source $HOME/.config/nvim/settings/airline.vim
source $HOME/.config/nvim/settings/snippets.vim
source $HOME/.config/nvim/settings/autocomplete.vim
