--- settings/languages/flutter.lua

local M = {}

function M.plug(manager)
    manager.add("dart-lang/dart-vim-plugin");
    manager.add("thosakwe/vim-flutter");
end

function M.setup()
    vim.cmd([[ autocmd BufRead,BufNewFile *.dart set cursorcolumn ]]);
    -- Dart
    vim.g.dart_style_guide = 1;
    vim.g.dart_format_on_save = false;
    -- Flutter
    vim.g.flutter_hot_reload_on_save = true;
    vim.g.flutter_show_log_on_run = "tab";
    vim.g.flutter_autoscroll = true;
end

return M

