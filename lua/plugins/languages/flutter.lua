--- settings/languages/flutter.lua

local M = {}

function M.install(use)
  use("dart-lang/dart-vim-plugin");
    -- manager.add("thosakwe/vim-flutter");
end

function M.config()
  -- vim.cmd([[ autocmd BufRead,BufNewFile *.dart set cursorcolumn ]]);

  -- Dart
  vim.g.dart_style_guide = 1;
  vim.g.dart_format_on_save = true;

  -- -- Flutter
  -- vim.g.flutter_hot_reload_on_save = true;
  -- vim.g.flutter_show_log_on_run = "tab";
  -- vim.g.flutter_autoscroll = true;
end

function M.lsp_config(caps, on_attach)
  local status_ok, nvim_lsp = pcall(require, "lspconfig");
  if not status_ok then
    return
  end
  -- nvim_lsp.dart.setup({
  -- });
end

return M

