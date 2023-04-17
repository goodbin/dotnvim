local mapping = require("core/mapping")

function install(use)
  use({ "lyokha/vim-xkbswitch", init = "xkb_config", lazy = true, cmd = "EnableXkbSwitch" })
end

function xkb_config(sp)
  vim.g.XkbSwitchEnabled = true
end

function config()
  vim.g.mapleader = " "
  vim.cmd("EnableXkbSwitch")

  local maps = mapping({ silent = true, noremap = true })

  -- Standard Operations
  maps:set("", "<space>", "<nop>")
  maps:set("n", "<C-s>", "<cmd>w<cr>", "Write buffer")
  maps:set("i", "<C-s>", "<esc><cmd>w<cr>", "Write buffer")
  maps:set("n", "<leader>h", "<cmd>nohlsearch<cr>", { desc = "No Highlight" })

  -- Off Ex mode
  maps:set("", "Q", "<nop>")

  -- Learn it the hard way
  maps:set("", "<up>", "<nop>")
  maps:set("", "<down>", "<nop>")
  maps:set("", "<left>", "<nop>")
  maps:set("", "<right>", "<nop>")

  -- Better window navigation
  maps:set("n", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Move to left split" })
  maps:set("n", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Move to below split" })
  maps:set("n", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Move to above split" })
  maps:set("n", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Move to right split" })

  maps:register()
end
