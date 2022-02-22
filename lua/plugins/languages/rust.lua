--- settings/languages/rust.lua

local M = {}

function M.install(use)
  use("rust-lang/rust.vim");
end

function M.config()
  vim.g.rust_recommended_style = true;
  vim.g.rustfmt_fail_silently = true;
  vim.g.syntastic_rust_checkers = {};
  vim.g.rust_fold = true;
end

function M.lsp_config(caps, on_attach)
  local status_ok, nvim_lsp = pcall(require, "lspconfig");
  if not status_ok then
    return
  end

  nvim_lsp.rust_analyzer.setup({
    capabilities = caps,
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    },
    settings = {
      ["rust-analyzer"] = {
        assist = {
        },
        checkOnSave = {
          -- enable = false,
        },
        experimental = {
          procAttrMacros = false
        },
        cargo = {
          loadOutDirsFromCheck = true,
          allFeatures = true,
          autoreload = true,
        },
        completion = {
          autoimport = {
            enable = false
          },
        },
        procMacro = {
          enable = true,
        },
      },
    },
  });
end

return M
