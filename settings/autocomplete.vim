" ================================================================================
"                                  My NeoVIM settings
"                                  Author: Oleg Lelenkov
" ================================================================================

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect


let g:LanguageClient_serverCommands = {
    \ 'd': ['/home/oleg/.dub/packages/.bin/dls-latest/dls']
    \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
let g:LanguageClient_diagnosticsEnable = 1
let g:LanguageClient_useVirtualText = 1

let g:LanguageClient_diagnosticsDisplay = {
\        1: {
\            "name": "Error",
\            "texthl": "ALEError",
\            "signText": "✖",
\            "signTexthl": "ALEErrorSign",
\            "virtualTexthl": "Error",
\        },
\        2: {
\            "name": "Warning",
\            "texthl": "ALEWarning",
\            "signText": "⚠",
\            "signTexthl": "ALEWarningSign",
\            "virtualTexthl": "TabLineFill",
\        },
\        3: {
\            "name": "Information",
\            "texthl": "ALEInfo",
\            "signText": "ℹ",
\            "signTexthl": "ALEInfoSign",
\            "virtualTexthl": "Todo",
\        },
\        4: {
\            "name": "Hint",
\            "texthl": "ALEInfo",
\            "signText": "➤",
\            "signTexthl": "ALEInfoSign",
\            "virtualTexthl": "Todo",
\        },
\    }

