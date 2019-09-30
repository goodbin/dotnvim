" ================================================================================
"                                  My NeoVIM settings
"                                  Author: Oleg Lelenkov
" ================================================================================

function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
endfunction

