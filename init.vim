" ================================================================================
"                                  My NeoVIM settings
"                                  Author: Oleg Lelenkov
" ================================================================================

filetype off 
call plug#begin()

Plug 'morhetz/gruvbox'                                          " Цветовая схема
Plug 'ryanoasis/vim-devicons'

Plug 'vim-airline/vim-airline'                                  " Статусная строка
Plug 'vim-airline/vim-airline-themes'                           " Темы для статустой строки

Plug 'vim-scripts/vim-auto-save'                                " автоматическое сохранение

Plug 'aperezdc/vim-template'                                    " Шаблоны
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'                                         " Сниппеты

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeFocus' }          " Файловый менеджер / дерево каталогов
Plug 'scrooloose/nerdcommenter'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'airblade/vim-gitgutter'                                   " Подсветка измененных строк по версии git

Plug 'lyokha/vim-xkbswitch'                                     " Автоматическое переключение раскладки
Plug 'editorconfig/editorconfig-vim'                            " .editorconfig

" Dlang
" Plug 'kiith-sa/DSnips', { 'for': 'd' }

" Plug 'posva/vim-vue', { 'for': 'vue' }
" Plug 'easymotion/vim-easymotion'
" Plug 'jiangmiao/auto-pairs'
" Plug 'kien/ctrlp.vim'

call plug#end()
filetype plugin indent on
filetype plugin on

source $HOME/.config/nvim/settings/functions.vim

" common settings
source $HOME/.config/nvim/settings/theme.vim
source $HOME/.config/nvim/settings/common.vim
source $HOME/.config/nvim/settings/keymapping.vim
source $HOME/.config/nvim/settings/airline.vim

" nerdtree
source $HOME/.config/nvim/settings/nerdtree.vim
source $HOME/.config/nvim/settings/nerdcommenter.vim

source $HOME/.config/nvim/settings/template.vim
source $HOME/.config/nvim/settings/snippets.vim

source $HOME/.config/nvim/settings/autocomplete.vim

"source $HOME/.config/nvim/settings/easymotion.vim
"source $HOME/.config/nvim/settings/autopairs.vim
