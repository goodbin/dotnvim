" ================================================================================
"                                  My NeoVIM settings
"                                  Author: Oleg Lelenkov
" ================================================================================

" Plug 'prabirshrestha/async.vim'
" Plug 'prabirshrestha/vim-lsp'
" Plug 'mattn/vim-lsp-settings'

" let g:lsp_settings = {
" \   'serve-d': {
" \     'cmd': ['/home/oleg/Develop/Vendor/serve-d/serve-d']
" \   },
" \}

" au User lsp_setup call lsp#register_server({
"         \ 'name': 'serve-d',
"         \ 'cmd': ['/home/oleg/Develop/Vendor/serve-d/serve-d', '-r', 'd'],
"         \ 'whitelist': ['d'],
"         \ 'initialization_options': {
"         \
"         \ }})

" let g:lsp_diagnostics_enabled = 1
" let g:lsp_log_verbose = 1
" let g:lsp_log_file = expand('/tmp/vim-lsp.log')

" for asyncomplete.vim log
" let g:asyncomplete_log_file = expand('/tmp/asyncomplete.log')


" let g:LanguageClient_serverCommands = {
"     \ 'd': ['/home/oleg/Development/Vendor/dls/dls']
"     \ }

" nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" let g:LanguageClient_diagnosticsEnable = 1
" let g:LanguageClient_useVirtualText = 'All'

" let g:LanguageClient_loggingFile = expand('/tmp/LanguageClient.log')
" let g:LanguageClient_loggingLevel = 'DEBUG'

" let g:LanguageClient_diagnosticsDisplay = {
" \        1: {
" \            "name": "Error",
" \            "texthl": "ALEError",
" \            "signText": "✖",
" \            "signTexthl": "ALEErrorSign",
" \            "virtualTexthl": "Error",
" \        },
" \        2: {
" \            "name": "Warning",
" \            "texthl": "ALEWarning",
" \            "signText": "⚠",
" \            "signTexthl": "ALEWarningSign",
" \            "virtualTexthl": "TabLineFill",
" \        },
" \        3: {
" \            "name": "Information",
" \            "texthl": "ALEInfo",
" \            "signText": "ℹ",
" \            "signTexthl": "ALEInfoSign",
" \            "virtualTexthl": "Todo",
" \        },
" \        4: {
" \            "name": "Hint",
" \            "texthl": "ALEInfo",
" \            "signText": "➤",
" \            "signTexthl": "ALEInfoSign",
" \            "virtualTexthl": "Todo",
" \        },
" \    }

