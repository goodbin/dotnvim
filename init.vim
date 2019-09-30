" ================================================================================
"                                  My NeoVIM settings
"                                  Author: Oleg Lelenkov
" ================================================================================

call plug#begin()

Plug 'vim-airline/vim-airline'                                  " Статусная строка
Plug 'vim-airline/vim-airline-themes'                           " Темы для статустой строки

Plug 'vim-scripts/vim-auto-save'                                " автоматическое сохранение
Plug 'lyokha/vim-xkbswitch'                                     " Автоматическое переключение раскладки

Plug 'editorconfig/editorconfig-vim'                            " .editorconfig

Plug 'airblade/vim-gitgutter'                                   " Подсветка измененных строк по версии git
Plug 'tpope/vim-fugitive'                                       " Работа с Git

Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'

Plug 'aperezdc/vim-template'                                    " Шаблоны

Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'                                         " Сниппеты

Plug 'scrooloose/nerdtree'                                      " Файловый менеджер / дерево каталогов
Plug 'scrooloose/nerdcommenter'

Plug 'morhetz/gruvbox'                                          " Цветовая схема
Plug 'ryanoasis/vim-devicons'

" Languages support
Plug 'sirtaj/vim-openscad'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
\}

Plug 'sheerun/vim-polyglot'

call plug#end()


filetype plugin indent on

source $HOME/.config/nvim/settings/functions.vim
source $HOME/.config/nvim/settings/common.vim
source $HOME/.config/nvim/settings/keymapping.vim

source $HOME/.config/nvim/settings/editorconfig.vim
source $HOME/.config/nvim/settings/theme.vim
source $HOME/.config/nvim/settings/airline.vim

source $HOME/.config/nvim/settings/autocomplete.vim

source $HOME/.config/nvim/settings/template.vim
source $HOME/.config/nvim/settings/nerdtree.vim
source $HOME/.config/nvim/settings/nerdcommenter.vim
source $HOME/.config/nvim/settings/snippets.vim

source $HOME/.config/nvim/settings/languages.vim

