--- settings/buffers

local icons = require("core/icons")
local mapping = require("core/mapping")

function install(use)
  use({ "akinsho/bufferline.nvim", event = "UIEnter", config = "config_bufferline" })
  use({ "famiu/bufdelete.nvim" })
end

local close_func = function(bufnum)
  local bufdelete_avail, bufdelete = pcall(require, "bufdelete")
  if bufdelete_avail then
    bufdelete.bufdelete(bufnum, true)
  else
    vim.cmd.bdelete({ args = { bufnum }, bang = true })
  end
end

function config_bufferline()
  local bufferline = require("bufferline")
  local bufdelete = require("bufdelete")

  bufferline.setup({
    options = {
      mode = "buffers",
      offsets = {
        {
          filetype = "neo-tree",
          text = "Explorer",
          text_align = "center",
          separator = true,
          padding = 0,
        },
      },
      buffer_close_icon = icons["BufferClose"],
      modified_icon = icons["FileModified"],
      close_icon = icons["NeovimClose"],
      close_command = close_func,
      right_mouse_command = close_func,
      max_name_length = 14,
      max_prefix_length = 13,
      tab_size = 20,
      always_show_bufferline = true,
      show_close_icon = false,
      show_buffer_close_icons = false,
      separator_style = "thin",
    },
  })

  local maps = mapping()
  maps:set("n", "<leader>c", function()
    bufdelete.bufdelete(0, false)
  end, { desc = "Close buffer" })
  maps:set("n", "<leader>C", function()
    bufdelete.bufdelete(0, true)
  end, { desc = "Force close buffer" })
  maps:set("n", "L", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer tab" })
  maps:set("n", "H", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous buffer tab" })
  maps:set("n", "<leader>p", "<cmd>BufferLinePick<cr>", { desc = "Buffer pick" })
  maps:register({ silent = true, noremap = true })
end
