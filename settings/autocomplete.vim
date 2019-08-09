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

