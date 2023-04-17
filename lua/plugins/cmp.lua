local utils = require("core.utils")

function install(use)
  use({ "onsails/lspkind.nvim", config = "lspkind_config" })
  use({ 
    "hrsh7th/nvim-cmp", 
    config = "cmp_config", 
    dependencies = { 
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "onsails/lspkind.nvim",
    }
  })
end

function lspkind_config()
  local lspkind = require("lspkind")
  lspkind.init({
    mode = "symbol",
    symbol_map = {
      NONE = "",
      Array = "",
      Boolean = "⊨",
      Class = "",
      Constructor = "",
      Key = "",
      Namespace = "",
      Null = "NULL",
      Number = "#",
      Object = "⦿",
      Package = "",
      Property = "",
      Reference = "",
      Snippet = "",
      String = "𝓐",
      TypeParameter = "",
      Unit = "",
      Text = "",
    },
  })
end

function cmp_config()
  local cmp = require("cmp")
  local lspkind_status_ok, lspkind = pcall(require, "lspkind")
  local snip_status_ok, luasnip = pcall(require, "luasnip")
  if not snip_status_ok then
    utils.error("Failed load luasnip plugin")
    return
  end

  local border_opts = {
    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
  }

  cmp.setup({
    enabled = function()
      if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
        return false
      end
      return true
    end,
    preselect = cmp.PreselectMode.None,
    formatting = {
      format = lspkind_status_ok and lspkind.cmp_format({
        menu = {
          buffer = "[Buffer]",
          nvim_lsp = "[LSP]",
          nvim_lua = "[Lua]",
          latex_symbols = "[Latex]",
        },
      }) or nil,
    },
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    completion = {
      completeopt = "menu,menuone",
      keyword_length = 2,
    },
    confirm_opts = {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    },
    window = {
      completion = { scrollbar = false },
      documentation = cmp.config.window.bordered(border_opts),
    },
    sources = {
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "buffer", keyword_length = 3 },
      { name = "nvim_lua" },
      { name = "path" },
    },
    mapping = {
      ["<CR>"] = cmp.mapping.confirm({ 
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      }),
      ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-2), { "i", "c" }),
      ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(2), { "i", "c" }),
      ["<C-n>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.mapping.select_next_item({
            behavior = cmp.SelectBehavior.Insert,
          })(fallback)
        else
          cmp.mapping.complete()(fallback)
        end
      end, { "i", "s" }),
      ["<C-p>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.mapping.select_prev_item({
            behavior = cmp.SelectBehavior.Insert,
          })(fallback)
        else
          cmp.mapping.complete()(fallback)
        end
      end, { "i", "s" }),
      ["<C-e>"] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ["<Tab>"] = cmp.mapping(function(fallback)
        if luasnip.in_snippet() and luasnip.jumpable(1) then
          luasnip.jump(1)
        else
          fallback()
        end
      end, { "i", "s" }),
    },
  })
end
