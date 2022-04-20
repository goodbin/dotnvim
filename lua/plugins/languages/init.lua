--- settings/languages/init.lua

local languages = {
  require("plugins.languages.rust"),
  require("plugins.languages.flutter"),
  -- require("settings.languages.dlang"),
  -- require("settings.languages.prelum"),
};

function install(use)
  use("neovim/nvim-lspconfig");  -- enable LSP
  use("cespare/vim-toml");       -- enable toml language

  for _, lang in ipairs(languages) do
    lang.install(use);
  end
end

local function lsp_highlight_document(client)
  -- Set autocommands conditional on server_capabilities
  -- if client.resolved_capabilities.document_highlight then
  --   vim.api.nvim_exec(
  --     [[
  --     augroup lsp_document_highlight
  --       autocmd! * <buffer>
  --       autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
  --       autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
  --     augroup END
  --   ]],
  --     false
  --   )
  -- end
end

local function lsp_keymaps(bufnr)
  local keymap = vim.api.nvim_buf_set_keymap;
  local opts = {noremap = true, silent = true};

  keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts);
  keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts);
  keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts);
  keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts);

  keymap(bufnr, "n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts);
  keymap(bufnr, "n", "K",  "<cmd>lua vim.lsp.buf.hover()<CR>", opts);

  keymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts);
  keymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts);
end

function config()
  for _, lang in ipairs(languages) do
    if lang.config then
      lang.config();
    end
  end

  local status_ok, _ = pcall(require, "lspconfig");
  if not status_ok then
    return
  end

  local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  if not status_ok then
    return
  end

  local capabilities = vim.lsp.protocol.make_client_capabilities();
  capabilities = cmp_nvim_lsp.update_capabilities(capabilities);

  local on_attach = function(client, bufnr)
    if client.name == "tsserver" then
      client.resolved_capabilities.document_formatting = false;
    end
    lsp_keymaps(bufnr);
    lsp_highlight_document(client);
  end

  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  };

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" });
  end

  local dia_config = {
    -- disable virtual text
    virtual_text = false,
    -- show signs
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  };

  vim.diagnostic.config(dia_config);

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })

  -- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  -- vim.lsp.diagnostic.on_publish_diagnostics, {
  --   virtual_text = {
  --     spacing = 2,
  --     prefix = "",
  --   },
  --   signs = true,
  --   update_in_insert = false,
  -- }
  -- );

  for _, lang in ipairs(languages) do
    if lang.lsp_config then
      lang.lsp_config(capabilities, on_attach);
    end
  end
end
