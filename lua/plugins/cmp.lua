-- plugins/cmp.lua

function install(use)
  use("hrsh7th/nvim-cmp");
  use("hrsh7th/cmp-buffer");
  use("hrsh7th/cmp-path");
  use("hrsh7th/cmp-cmdline");
  use("hrsh7th/cmp-nvim-lsp");
  use("saadparwaiz1/cmp_luasnip");

  -- use("hrsh7th/cmp-nvim-lsp-signature-help");
  use("onsails/lspkind.nvim");
end

local check_backspace = function()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

-- local has_words_before = function()
--   local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--   return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
-- end

function config()
  vim.opt.completeopt = { "menuone" , "noselect" };
  vim.opt.shortmess:append "c"
  vim.opt.whichwrap:append("<,>,[,],h,l")
  vim.opt.iskeyword:append("-")

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
    experimental = {
      ghost_text = false,
      native_menu = false,
    },
    confirm_opts = {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    },
    completion = {
      keyword_length = 1,
    },
    mapping = {
      ["<CR>"] = cmp.mapping.confirm({ select = true }),
      ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-2), { "i", "c" }),
      ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(2), { "i", "c" }),
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
      { name = "path" },
      { name = "nvim_lsp" },
      { name = 'nvim_lsp_signature_help' },
      { name = "luasnip" },
      {
        name = "buffer",
        option = {
          get_bufnrs = function() -- from visible buffers
            local bufs = {}
            for _, win in ipairs(vim.api.nvim_list_wins()) do
              bufs[vim.api.nvim_win_get_buf(win)] = true
            end
            return vim.tbl_keys(bufs)
          end
        }
      },
    },
  })
end
