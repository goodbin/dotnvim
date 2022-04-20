-- plugins/cmp.lua

function install(use)
  use("hrsh7th/nvim-cmp");
  use("hrsh7th/cmp-buffer");
  use("hrsh7th/cmp-path");
  use("hrsh7th/cmp-cmdline");
  use("hrsh7th/cmp-nvim-lsp");
  use("saadparwaiz1/cmp_luasnip");
end

--   פּ ﯟ   some other good icons
local kind_icons = {
  Text = "",
  Method = "m",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}
-- find more here: https://www.nerdfonts.com/cheat-sheet

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

function config()
  -- Show tab completion window
  vim.opt.completeopt = "menuone,noselect";
  vim.opt.shortmess:append "c";

  local status_ok, cmp = pcall(require, "cmp");
  if not status_ok then
    return;
  end

  local status_ls, luasnip = pcall(require, "luasnip");
  if not status_ls then
    return;
  end

  cmp.setup({
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body);
      end,
    },
    mapping = {
      ["<CR>"] = cmp.mapping.confirm({ select = true }),
      ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-2), { "i", "c" }),
      ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(2), { "i", "c" }),
      ['<C-n>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.mapping.select_next_item({
              behavior = cmp.SelectBehavior.Insert,
            })(fallback)
          else
            cmp.mapping.complete()(fallback)
          end
      end, { "i", "s" }),
      ["<C-e>"] = cmp.mapping {
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
      },
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_locally_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" }),
    },
    preselect = true,
    formatting = {
      fields = { "kind", "abbr", "menu" },
      format = function(entry, vim_item)
        vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
        vim_item.menu = ({
          nvim_lsp = "[LSP]",
          luasnip = "[Snippet]",
          buffer = "[Buffer]",
          path = "[Path]",
        })[entry.source.name]
        return vim_item
      end,
    },
    confirm_opts = {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    },
    window = {
      documentation = {
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
      },
    },
    experimental = {
      ghost_text = false,
      native_menu = false,
    },
    sources = {
      { name = "path" },
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "buffer" },
    },
  })
end
