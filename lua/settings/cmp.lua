-- settings/cmp

function install(use)
  use("hrsh7th/cmp-buffer");
  use("hrsh7th/cmp-nvim-lsp");
  use("saadparwaiz1/cmp_luasnip");
  use("onsails/lspkind.nvim");
  use("hrsh7th/nvim-cmp");
  use("hrsh7th/cmp-nvim-lsp-signature-help");
end

function config()
  vim.opt.completeopt = { "menu", "menuone" , "noselect" };
  -- Avoid showing extra messages when using completion
  vim.opt.shortmess:append "c"
  -- vim.opt.whichwrap:append("<,>,[,],h,l")
  -- vim.opt.iskeyword:append("-")

  local status_ok, cmp = pcall(require, "cmp");
  if not status_ok then
    return;
  end

  local status_ls, luasnip = pcall(require, "luasnip");
  if not status_ls then
    return;
  end

  local status_kd, lspkind = pcall(require, "lspkind");
  if not status_kd then
    return;
  end

  cmp.setup({
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body);
      end,
    },
    preselect = cmp.PreselectMode.None,
    completion = {
      keyword_length = 1,
    },
    mapping = {
      ["<CR>"] = cmp.mapping.confirm({ select = true }),
      ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(2), { "i", "c" }),
      ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-2), { "i", "c" }),
      ["<C-e>"] = cmp.mapping({
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
      }),
      ['<C-n>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.mapping.select_next_item({
                behavior = cmp.SelectBehavior.Insert,
              })(fallback)
            else
              cmp.mapping.complete()(fallback)
            end
        end, { "i", "s" }),
      ['<C-p>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.mapping.select_prev_item({
                behavior = cmp.SelectBehavior.Insert,
              })(fallback)
            else
              cmp.mapping.complete()(fallback)
            end
        end, { "i", "s" }),
      ["<Tab>"] = cmp.mapping(function(fallback)
          if luasnip.in_snippet() and luasnip.jumpable(1) then
            luasnip.jump(1);
          else
            fallback()
          end
        end, { "i", "s" }),
    },
    formatting = {
      format = lspkind.cmp_format({
        mode = "symbol_text",
        menu = {
          buffer = "[Buffer]",
          nvim_lsp = "[LSP]",
          luasnip = "[Snip]",
          path = "[Path]",
          nvim_lua = "[Lua]",
          latex_symbols = "[Latex]",
        },
        symbol_map = {
          Text = "",
          TypeParameter = "",
        },
      }),
    },
    window = {
      documentation = {
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
      },
    },
    sources = {
      { name = "nvim_lsp" },
      { name = 'nvim_lsp_signature_help' },
      { name = "luasnip" },
      { name = 'buffer', keyword_length = 5 },
    },
  });
end
