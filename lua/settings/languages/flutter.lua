--- settings/languages/flutter.lua

local M = {}

function M.plug(manager)
    -- plug.register(
    --     {'dart-lang/dart-vim-plugin'},
    --     {'thosakwe/vim-flutter'},
end

function M.setup()
    --au BufRead,BufNewFile *.dart set cursorcolumn
    --" Dart
    --let g:dart_style_guide = 1
    --let g:dart_format_on_save = 0
end

return M

