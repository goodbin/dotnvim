function install(use)
  -- use({
  --   "nvim-treesitter/nvim-treesitter-textobjects",
  --   init = "textobject_init",
  -- })
  use({ "JoosepAlviste/nvim-ts-context-commentstring" })
  use({
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = "treesitter_config",
    dependencies = {
      -- {"nvim-treesitter/nvim-treesitter-textobjects"},
      { "JoosepAlviste/nvim-ts-context-commentstring" },
    }
  })
  -- use({
  --   "windwp/nvim-ts-autotag",
  --   after = "nvim-treesitter",
  -- })
end

function treesitter_config()
  local tconfig = require("nvim-treesitter.configs")

  tconfig.setup({
    auto_install = true,
    indent = { enable = true },
    highlight = {
      enable = true,
      use_languagetree = true,
      -- additional_vim_regex_highlighting = false,
    },
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
  --   autotag = {
  --     enable = true,
  --   },
  --   incremental_selection = {
  --     enable = true,
  --   },
  --   autopairs = {
  --     enable = true,
  --   },
  })

  vim.opt["foldmethod"] = "expr"
  vim.opt["foldexpr"] = "nvim_treesitter#foldexpr()"
  vim.opt["foldenable"] = false
end
