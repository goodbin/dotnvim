" ================================================================================
"                                  My NeoVIM settings
"                                  Author: Oleg Lelenkov
" ================================================================================

call plug#begin()
source $HOME/.config/nvim/settings/editorconfig.vim
source $HOME/.config/nvim/settings/theme.vim
source $HOME/.config/nvim/settings/airline.vim
source $HOME/.config/nvim/settings/keymapping.vim
source $HOME/.config/nvim/settings/autosave.vim
source $HOME/.config/nvim/settings/nerdtree.vim
source $HOME/.config/nvim/settings/snippets.vim
source $HOME/.config/nvim/settings/autocomplete.vim
source $HOME/.config/nvim/settings/lsp.vim
source $HOME/.config/nvim/settings/languages.vim

Plug 'airblade/vim-gitgutter'           " Подсветка измененных строк по версии git
" Plug 'kshenoy/vim-signature'		" Работа с закладками

call plug#end()
filetype plugin indent on

source $HOME/.config/nvim/settings/functions.vim
source $HOME/.config/nvim/settings/common.vim
colorscheme gruvbox
