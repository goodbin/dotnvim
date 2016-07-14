" ================================================================================
"                                  My NeoVIM settings
"                                  Author: Oleg Lelenkov
" ================================================================================

source plug.vim






" Settings autocomplete plugin
call deoplete#enable()

let g:XkbSwitchEnabled = 1
let g:XkbSwitchIMappings = ['ru']

syntax on

" Default Whitespace
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set number

" ---
" Font
" ---
set encoding=utf-8

" ---
" Theme
" ---
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

set background=dark
"let g:gruvbox_contrast_dark='soft'
let g:gruvbox_invert_signs=0
let g:gruvbox_sign_column='dark0'
colorscheme gruvbox

" ---
" AirLine
" ---
" Set theme
let g:airline_theme = 'gruvbox'
" Show airline with single file
set laststatus=2
" Use powerline font
let g:airline_powerline_fonts = 1
" Enable tabline
let g:airline#extensions#tabline#enabled = 1

" Searching and highlines
set hlsearch
set incsearch
set ignorecase
set smartcase           

" =====================================================================
"                         MAPPINGS
" =====================================================================
let g:mapleader=','

map <C-n> :NERDTreeToggle<CR>

" Learn it the hard way
nmap <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Keep more content at the bottom of the buffer
set scrolloff=5

" Highlight cirsor line
set cursorline

" Настройка общего буфера обмена с ОС
" Необходимо установить xsel 
set clipboard+=unnamedplus

set nobackup 
set noswapfile

