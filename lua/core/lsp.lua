--- core/lsp

local mapping = require("core/mapping")

local M = {}

function M.on_attach(client, bufnr)
  local caps = client.server_capabilities
  local maps = mapping({ buffer = bufnr })

  maps:set("n", "E", function()
    vim.diagnostic.open_float()
  end, { desc = "Hover diagnostics" })
  maps:set("n", "[d", function()
    vim.diagnostic.goto_prev({ border = "rounded" })
  end, { desc = "Previous diagnostic" })
  maps:set("n", "]d", function()
    vim.diagnostic.goto_next({ border = "rounded" })
  end, { desc = "Next diagnostic" })

  if caps.codeActionProvider then
    maps:set("n", "<leader>la", function()
      vim.lsp.buf.code_action()
    end, { desc = "LSP code action" })
    maps:set("v", "<leader>la", function()
      vim.lsp.buf.code_action()
    end, { desc = "LSP code action" })
  end

  if caps.codeLensProvider then
    maps:set("n", "<leader>ll", function()
      vim.lsp.codelens.refresh()
    end, { desc = "LSP codelens refresh" })
    maps:set("n", "<leader>lL", function()
      vim.lsp.codelens.run()
    end, { desc = "LSP codelens run" })
  end

  if caps.declarationProvider then
    maps:set("n", "gD", function()
      vim.lsp.buf.declaration()
    end, { desc = "Declaration of current symbol" })
  end

  if caps.definitionProvider then
    maps:set("n", "gd", function()
      vim.lsp.buf.definition()
    end, { desc = "Show the definition of current symbol" })
  end

  if caps.hoverProvider then
    maps:set("n", "K", function()
      vim.lsp.buf.hover()
    end, { desc = "Hover symbol details" })
  end

  if caps.implementationProvider then
    maps:set("n", "gI", function()
      vim.lsp.buf.implementation()
    end, { desc = "Implementation of current symbol" })
  end

  if caps.referencesProvider then
    maps:set("n", "gr", function()
      vim.lsp.buf.references()
    end, { desc = "References of current symbol" })
  end

  if caps.renameProvider then
    maps:set("n", "<leader>lr", function()
      vim.lsp.buf.rename()
    end, { desc = "Rename current symbol" })
  end

  if caps.signatureHelpProvider then
    maps:set("n", "<leader>lh", function()
      vim.lsp.buf.signature_help()
    end, { desc = "Signature help" })
  end

  if caps.documentFormattingProvider then
    maps:set("n", "<leader>lf", function()
      vim.lsp.buf.format({ async = true })
    end, { desc = "Format code" })
  end

  maps:register()
end

return M
