" ================================================================================
"                                  My NeoVIM settings
"                                  Author: Oleg Lelenkov
" ================================================================================

let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0

" if you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsUsePythonVersion = 3

let g:UltiSnipsSnippetDirectories=[$HOME."/.config/nvim/UltiSnips", $HOME."/.config/nvim/plugged/vim-snippets/UltiSnips"]

" Шаблоны
let g:templates_directory = [
    \   $HOME."/.config/nvim/templates",
    \   $HOME."/.config/nvim/plugged/vim-template/templates"
    \]

let g:templates_no_autocmd=0

let g:templates_user_variables = [
    \['COPY', "GetCopyright"],
    \['MODULE', 'GetModule'],
    \]


function! GetCopyright()
    return luaeval('functions.GetCopyright()')
endfunction


function! GetModule()
    return luaeval('functions.GetModule()')
endfunction

