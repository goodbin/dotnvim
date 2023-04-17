enabled = false

local on_attach = require("core/lsp").on_attach

function install(use)
  -- use({ "jose-elias-alvarez/null-ls.nvim", config = "null_ls_config" })
end

function null_ls_config()
  local null_ls = require("null-ls")

  local formatting = null_ls.builtins.formatting
  local diagnostics = null_ls.builtins.diagnostics

  null_ls.setup({
    on_attach = on_attach,
    debug = true,
    sources = {
      --       formatting.prettier.with {
      --         extra_filetypes = { "toml" },
      --         extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
      --       },
      --       formatting.black.with { extra_args = { "--fast" } },
      formatting.stylua,
      --       formatting.google_java_format,
      --       diagnostics.flake8,
    },
  })
end
