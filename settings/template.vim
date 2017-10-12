" ================================================================================
"                                  My NeoVIM settings
"                                  Author: Oleg Lelenkov
" ================================================================================

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
    let l:module = substitute(expand("%:r"), "/", ".", "g")
    return substitute(l:module, '^\('.join(l:skip_module_dir, '\|').'\).', "", "g")
endfunction

