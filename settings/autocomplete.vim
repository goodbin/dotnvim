" ================================================================================
"                                  My NeoVIM settings
"                                  Author: Oleg Lelenkov
" ================================================================================

let g:ncm2_d#dcd_client_bin = '/home/oleg/Development/Vendor/D/DCD/bin/dcd-client'
let g:ncm2_d#dcd_client_args = ['']
let g:ncm2_d#dcd_server_bin = '/home/oleg/Development/Vendor/D/DCD/bin/dcd-server'
let g:ncm2_d#dcd_server_args = ['']
let g:ncm2_d#dcd_autostart_server = 1

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

