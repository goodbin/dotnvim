filetype off
call vim_lib#sys#Autoload#init('.vim', 'bundle')
so .vim/plugins.vim
filetype indent plugin on

let g:vim_prj#opt = {'author': 'Oleg Lelenkov', 'license': 'MIT'}
