" ================================================================================
"                                  My NeoVIM settings
"                                  Author: Oleg Lelenkov
" ================================================================================

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

" Vim-plugin =====================================================================
filetype off
call plug#begin()
" тулбар 
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

" автокомплит
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'landaire/deoplete-d'

" темы
Plug 'chriskempson/vim-tomorrow-theme'

" файловый трей
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
call plug#end()
filetype plugin indent on

call deoplete#enable()
let g:deoplete#sources#d#dcd_client_binary = '/home/oleg/Distrib/DTool/DCD/dcd-client'
let g:deoplete#sources#d#dcd_server_binary = '/home/oleg/Distrib/DTool/DCD/dcd-server'
let g:deoplete#sources#d#dcd_server_autostart = 1

" Default Whitespace
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

syntax enable
set number showmatch

colorscheme Tomorrow-Night

" =====================================================================
"                         MAPPINGS
" =====================================================================
" Better ESC
map <C-n> :NERDTreeToggle<CR>




" Wrapping text by default
" set wrap
"set linebreak

" Searching and highlines
"set hlsearch
"set incsearch
"set ignorecase
"set smartcase
"nnoremap <silent> <Space> :nohl<Bar>:echo<CR>

" Keep more content at the bottom of the buffer
"set scrolloff=3

" Highlight cirsor line
"set cursorline

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

" =====================================================================
"                        Terminal
" ====================================================================
" 256 colors for terminal vim
" set t_Co=256

" Making cursor a bar in insert mode
" if exists('$TMUX')
"     let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
"    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
" else
"    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
"endif




