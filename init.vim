" ================================================================================
"                                  My NeoVIM settings
"                                  Author: Oleg Lelenkov
" ================================================================================

function! DoRemote(arg)
    UpdateRemotePlugins
endfunction

" =============================  VIM-Plug  =======================================
filetype off
call plug#begin()

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" GIT
Plug 'airblade/vim-gitgutter'

" NERDTree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }

" Colorschemes
Plug 'morhetz/gruvbox'


call plug#end()
filetype plugin indent on
"^================================ VIM-Plug ======================================

" Settings autocomplete plugin
call deoplete#enable()

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
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" set t_Co=256
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

" Tab completion
"set wildmenu
"set wildmode=list:longest,list:full
"set wildignore+=*.o,*.obj,.git,.idea/*

" Allow backspacing over everything in insert mode
"set backspace=indent,eol,start

" Directories for swp files
"set backupdir=~/.config/nvim/vim_backups//
"set directory=~/.config/nvim/vim_backups//
"set viewdir=~/.config/nvim/vim_backups//

" Show (partical) command in the status line
"set showcmd
"set hidden
"set history=1000

