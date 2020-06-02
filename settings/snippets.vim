" ================================================================================
"                                  My NeoVIM settings
"                                  Author: Oleg Lelenkov
" ================================================================================

Plug 'aperezdc/vim-template'                                    " Шаблоны
Plug 'honza/vim-snippets'                                       " Коллекция сниппетов
Plug 'SirVer/ultisnips'                                         " Сниппеты UltiSnips


" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<Plug>(ultisnips_expand)"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0

" if you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsUsePythonVersion = 3

let g:UltiSnipsSnippetDirectories=[$HOME."/.config/nvim/UltiSnips", $HOME."/.config/nvim/plugged/vim-snippets/UltiSnips"]


" ===================================Templates=======================================

let g:templates_directory = [$HOME."/.config/nvim/templates", $HOME."/.config/nvim/plugged/vim-template/templates"]
let g:templates_no_autocmd=0
" let g:templates_debug=1

let g:templates_user_variables = [
        \   ['COPY', 'GetCopyright'],
        \   ['MODULE', 'GetModule'],
        \]


function! GetCopyright()
    return exists("g:copyright") ? g:copyright : ""
endfunction


function! GetModule()
    let l:skip_module_dir = exists("g:skip_module_dir") ? g:skip_module_dir : ["source", "test"]
    " замена слешей на точки
    let l:module = substitute(expand("%:r"), "/", ".", "g")
    " вырезаем название директорий с исходниками
    let l:ret = substitute(l:module, '^\('.join(l:skip_module_dir, '\|').'\).', "", "g")
    " вырезаем ключевое слово package
    return substitute(ret, "\\.package", "", "g")
endfunction

