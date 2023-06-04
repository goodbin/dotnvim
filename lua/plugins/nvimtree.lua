local mapping = require("core/mapping")
local icons = require("core/icons")

function install(use)
  use({"nvim-tree/nvim-tree.lua", config = "nvim_tree_config"})
end

local function open_nvim_tree(data)
  local api = require("nvim-tree.api")
  vim.schedule(function()
    local bufname = vim.api.nvim_buf_get_name(data.buf)
    local stats = vim.loop.fs_stat(bufname)
    local is_dir = stats and stats.type == "directory"

    local lines = not is_dir and vim.api.nvim_buf_get_lines(data.buf, 0, -1, false) or {}
    local buf_has_content = #lines > 1 or (#lines == 1 and lines[1] ~= "")
    local buf_is_empty = bufname == "" and not buf_has_content

    if is_dir or buf_is_empty then
      api.tree.open()
    end
  end)
end

local function on_attach(bufnr)
  local api = require("nvim-tree.api")

  vim.keymap.set('n', '<C-s>', api.node.open.horizontal, { 
    desc = 'Open: Horizontal Split',
    buffer = bufnr,
    noremap = true,
    silent = true,
    nowait = true })

  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.del('n', 's', { buffer = bufnr })
  vim.keymap.del('n', 'C', { buffer = bufnr })
end

function nvim_tree_config()
  local status_ok, tree = pcall(require, "nvim-tree")
  if not status_ok then
    return
  end

  tree.setup({
    disable_netrw = true,
    hijack_netrw = true,
    hijack_cursor = true,
    hijack_unnamed_buffer_when_opening = false,
    sync_root_with_cwd = true,
    on_attach = on_attach,
    hijack_directories = {
      enable = true,
      auto_open = true,
    },
    renderer = {
      group_empty = true,
      add_trailing = false,
      indent_width = 0,
      icons = {
        webdev_colors = true,
        git_placement = "after",
        glyphs = {
          git = {
            unstaged = "",
            staged = "✓",
            unmerged = "",
            renamed = "➜",
            untracked = "",
            deleted = "",
            ignored = "◌",
          },
        },
      },
      indent_markers = {
        enable = false,
      },
    },
    filters = {
      dotfiles = true,
    },
    git = {
      enable = true,
      ignore = false,
      timeout = 1000,
    },
    actions = {
      open_file = {
        resize_window = true,
      }
    },
    filesystem_watchers = {
      enable = true,
    },
    filters = {
      dotfiles = true,
    },
    view = {
      preserve_window_proportions = true,
      adaptive_size = true,
      mappings = {
        custom_only = false,
      }
    }
  })

  vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

  vim.api.nvim_create_autocmd("BufEnter", {
    nested = true,
    callback = function()
      local api = require('nvim-tree.api')

      if #vim.api.nvim_list_wins() == 1 and api.tree.is_tree_buf() then
        vim.defer_fn(function()
          vim.cmd("new")
          api.tree.toggle({find_file = true, focus = true})
          api.tree.toggle({find_file = true, focus = true})
        end, 0)
      end
    end
  })

  local maps = mapping({ silent = true, noremap = true })
  maps:set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle Explorer" })
  maps:set("n", "<leader>o", "<cmd>NvimTreeFocus<cr>", { desc = "Focus Explorer" })
  maps:register()
end

