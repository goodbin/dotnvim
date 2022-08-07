--- plugins/languages/null.lua

local M = {}

function M.install(use)
  use("jose-elias-alvarez/null-ls.nvim");  -- for formatters and linters
end

function M.config()
  local null_ls_status_ok, null_ls = pcall(require, "null-ls")
  if not null_ls_status_ok then
    return
  end

  local formatting = null_ls.builtins.formatting
  local diagnostics = null_ls.builtins.diagnostics

  null_ls.setup {
    debug = false,
    sources = {
      formatting.prettier.with {
        extra_filetypes = { "toml" },
        extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
      },
      formatting.black.with { extra_args = { "--fast" } },
      formatting.stylua,
      formatting.google_java_format,
      diagnostics.flake8,
    },
  }
end

function M.lsp_config(caps, on_attach)
end

return M

