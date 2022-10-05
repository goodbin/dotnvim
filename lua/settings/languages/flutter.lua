--- settings/languages/flutter.lua

enabled = false;

function install(use)
  use("dart-lang/dart-vim-plugin");
  -- manager.add("thosakwe/vim-flutter");
end

function config()
  -- vim.cmd([[ autocmd BufRead,BufNewFile *.dart set cursorcolumn ]]);
  -- vim.cmd([[autocmd Filetype dart setlocal ts=2 sw=2 expandtab]]);

  -- Dart
  vim.g.dart_style_guide = 2;
  vim.g.dart_trailing_comma_indent = true;
  -- vim.g.dart_format_on_save = true;

  -- -- Flutter
  -- vim.g.flutter_hot_reload_on_save = true;
  -- vim.g.flutter_show_log_on_run = "tab";
  -- vim.g.flutter_autoscroll = true;
end

function lsp_config(nvim_lsp, caps, on_attach)
  nvim_lsp.dartls.setup({
    capabilities = caps,
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    },
    cmd = { "dart", "language-server", "--lsp" }
  });
end

