-- settings/telescope.lua

local icons = require("core/icons")
local mapping = require("core/mapping")

function install(use)
  use({ "nvim-telescope/telescope.nvim", config = "telescope_config" })
end

function telescope_config()
  local telescope = require("telescope")
  local actions = require("telescope.actions")

  telescope.setup({
    defaults = {
      prompt_prefix = string.format("%s ", icons["Search"]),
      selection_caret = string.format("%s ", icons["Selected"]),
      path_display = { "truncate" },
      sorting_strategy = "ascending",
      layout_config = {
        horizontal = {
          prompt_position = "top",
          preview_width = 0.55,
          results_width = 0.8,
        },
        vertical = {
          mirror = false,
        },
        width = 0.87,
        height = 0.80,
        preview_cutoff = 120,
      },
      mappings = {
        i = {
          ["<C-n>"] = actions.cycle_history_next,
          ["<C-p>"] = actions.cycle_history_prev,
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
        },
        n = { ["q"] = actions.close },
      },
    },
  })

  local builtin = require("telescope.builtin")
  local maps = mapping({ silent = true, noremap = true })
  maps:set("n", "<leader>fw", builtin.live_grep, { desc = "Search words" })
  maps:set("n", "<leader>ff", builtin.find_files, { desc = "Search files" })
  maps:set("n", "<leader>fc", builtin.grep_string, { desc = "Search for work under cursor" })
  maps:register()
end
