" ================================================================================
"                                  My NeoVIM settings
"                                  Author: Oleg Lelenkov
" ================================================================================

function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    " Открвать дубль окна
    "if (t:curwin == winnr())
    "    if (match(a:key, '[jk]'))
    "        wincmd v
    "    else
    "        wincmd s
    "    endif
    "    exec "wincmd ".a:key
    "endif
endfunction

