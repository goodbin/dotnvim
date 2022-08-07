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

  local cargo_config = vim.g.project_cargo or {};
  cargo_config["loadOutDirsFromCheck"] = true;
  cargo_config["allFeatures"] = true;
  cargo_config["autoreload"] = true;

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
          procAttrMacros = true
        },
        cargo = cargo_config,
        completion = {
          addCallArgumentSnippets = false,
          postfix = {
            enable = false,
          },
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
