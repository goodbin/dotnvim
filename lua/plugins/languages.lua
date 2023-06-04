local icons = require("core/icons")
local plugins = require("core/plugins")
local on_attach = require("core/lsp").on_attach
local languages = {}

local langs_path = require("core.utils").join(vim.fn.stdpath("config"), "lua", "languages")
for lang in vim.fs.dir(langs_path) do
  local name = vim.split(lang, ".", { plain = true })[1]
  local path = "languages/" .. name
  local module = plugins.load(path)
  if module then
    languages[name] = module
  end
end

function install(use)
  use({ "neovim/nvim-lspconfig", config = "lsp_config" })
end

function lsp_config()
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })

  local signs = {
    { name = "DiagnosticSignError", text = icons["DiagnosticError"] },
    { name = "DiagnosticSignWarn", text = icons["DiagnosticWarn"] },
    { name = "DiagnosticSignHint", text = icons["DiagnosticHint"] },
    { name = "DiagnosticSignInfo", text = icons["DiagnosticInfo"] },
    { name = "DiagnosticSignError", text = icons["DiagnosticError"] },
    { name = "DapStopped", text = icons["DapStopped"], texthl = "DiagnosticWarn" },
    { name = "DapBreakpoint", text = icons["DapBreakpoint"], texthl = "DiagnosticInfo" },
    { name = "DapBreakpointRejected", text = icons["DapBreakpointRejected"], texthl = "DiagnosticError" },
    { name = "DapBreakpointCondition", text = icons["DapBreakpointCondition"], texthl = "DiagnosticInfo" },
    { name = "DapLogPoint", text = icons["DapLogPoint"], texthl = "DiagnosticInfo" },
  }

  for _, sign in ipairs(signs) do
    if not sign.texthl then
      sign.texthl = sign.name
    end
    vim.fn.sign_define(sign.name, sign)
  end

  vim.diagnostic.config({
    virtual_text = false,
    signs = {
      active = signs,
    },
    update_in_insert = true,
    severity_sort = true,
    underline = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  })

  local nvim_lsp = require("lspconfig")
  local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  local capabilities = status_ok and cmp_nvim_lsp.default_capabilities(capabilities)

  capabilities.textDocument.completion.completionItem = {
    documentationFormat = { "markdown", "plaintext" },
    snippetSupport = true,
    preselectSupport = true,
    insertReplaceSupport = true,
    labelDetailsSupport = true,
    deprecatedSupport = true,
    commitCharactersSupport = true,
    tagSupport = { valueSet = { 1 } },
    resolveSupport = {
      properties = { 
        "documentation", 
        "detail", 
        "additionalTextEdits"
      },
    },
  }

  local flags = {
    debounce_text_changes = 150,
  }

  for _, lang in pairs(languages) do
    if type(lang.lsp_config) == "function" and lang.enabled then
      lang.lsp_config(nvim_lsp, capabilities, on_attach, flags)
    end
  end
end
