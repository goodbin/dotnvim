enabled = false

function install(use)
  -- use({ "dart-lang/dart-vim-plugin", config = "dart_config" });
  -- manager.add("thosakwe/vim-flutter");
end

function dart_config()
  vim.g.dart_style_guide = 2
  vim.g.dart_trailing_comma_indent = true
  -- vim.g.dart_format_on_save = true;
end

function flutter_config()
  -- vim.cmd([[ autocmd BufRead,BufNewFile *.dart set cursorcolumn ]]);
  -- vim.cmd([[autocmd Filetype dart setlocal ts=2 sw=2 expandtab]]);
  -- -- Flutter
  -- vim.g.flutter_hot_reload_on_save = true;
  -- vim.g.flutter_show_log_on_run = "tab";
  -- vim.g.flutter_autoscroll = true;
end

function lsp_config(nvim_lsp, caps, on_attach, flags)
  nvim_lsp.dartls.setup({
    capabilities = caps,
    on_attach = on_attach,
    flags = flags,
    cmd = { "dart", "language-server", "--lsp" }
  });
end

