-- settings/languages/init.lua

local utils = require("core/utils");

local function load_languages()
  local out = {};
  local root_path = vim.fs.normalize(utils.script_path());
  for lang in vim.fs.dir(root_path) do
    if lang ~= "init.lua" then 
      lang = vim.split(lang, '.', { plain=true })[1];
      local path = "settings.languages." .. lang;
      local module = utils.load_module(path, function(n, o, m)
        o.name = n;
        if m.enabled then
          o.enabled = true;
          o.install = m.install;
          o.config = m.config;
          o.lsp_config = m.lsp_config;
        else
          o.enabled = false;
        end
      end);
      table.insert(out, module);
    end
  end
  return out;
end

local languages = load_languages();

function install(use)
  use("neovim/nvim-lspconfig");

  for _, lang in ipairs(languages) do
    if lang.install then
      lang.install(use);
    end
  end

  -- Languages
  use("cespare/vim-toml");
  use("khaveesh/vim-fish-syntax");
end

local function lsp_keymaps(bufnr)
  local keymap = vim.keymap;
  local opts = {noremap = true, silent = true, buffer = bufnr};

  keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts);
  keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts);
  keymap.set("n", "K",  "<cmd>lua vim.lsp.buf.hover()<CR>", opts);
  keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts);
  keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts);
  keymap.set('n', 'E', '<cmd>lua vim.diagnostic.open_float()<CR>', opts);

  keymap.set("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts);
  keymap.set("n", "F", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", opts);
  keymap.set('n', '<leader>lr', "<cmd>lua vim.lsp.buf.rename()<CR>", opts);
  keymap.set("n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts);

  keymap.set("n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts);
  keymap.set("n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts);
end

function config()
  for _, lang in ipairs(languages) do
    if lang.config then
      lang.config();
    end
  end

  local status_ok, nvim_lsp = pcall(require, "lspconfig");
  if not status_ok then
    return
  end

  local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  if not status_ok then
    return
  end

  local capabilities = vim.lsp.protocol.make_client_capabilities();
--   capabilities.workspace.configuration = true;
--   capabilities.workspace.workspaceEdit.documentChanges = true;
--   capabilities.textDocument.completion.completionItem.snippetSupport = true;
--   capabilities.textDocument.documentColor = { dynamicRegistration = true };
  capabilities = cmp_nvim_lsp.update_capabilities(capabilities);

  local on_attach = function(client, bufnr)
    lsp_keymaps(bufnr);
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

  vim.diagnostic.config({
    virtual_text = false,
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
  });

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded"
  });

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded"
  });

  for _, lang in ipairs(languages) do
    if lang.lsp_config then
      lang.lsp_config(nvim_lsp, capabilities, on_attach);
    end
  end
end

