function install(use)
  use({ "lewis6991/gitsigns.nvim", ft = "gitcommit", init = "gitsigns_init", config = "gitsigns_config" })
end

function gitsigns_init()
  vim.api.nvim_create_autocmd({ "BufRead" }, {
    group = vim.api.nvim_create_augroup("GitSignsLazyLoad", { clear = true }),
    callback = function()
      vim.fn.system("git -C \"" .. vim.fn.expand("%:p:h") .. "\" rev-parse")
      if vim.v.shell_error == 0 then
        vim.api.nvim_del_augroup_by_name("GitSignsLazyLoad")
        vim.schedule(function()
          require("lazy").load({ plugins = { "gitsigns.nvim" } })
        end)
      end
    end
  })
end

function gitsigns_config()
  local gitsigns = require("gitsigns")

  gitsigns.setup({
    signcolumn = true,
    signs = {
      add = { text = " ▎", numhl = "GitSignsAddNr" },
      change = { text = " ▎" },
      delete = { text = " ▎" },
      topdelete = { text = "契" },
      changedelete = { hl = "DiffChangeDelete", text = " ▎", numhl = "GitSignsChangeNr" },
      untracked = { text = " ▎" },
    },
  })
end
