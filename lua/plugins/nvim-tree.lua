-- plugins/nvim-tree.lua

function install(use)
  use("kyazdani42/nvim-tree.lua");
end

function config()
  local status_ok, nvim_tree = pcall(require, "nvim-tree");
  if not status_ok then
    return;
  end

  local status_ok, nvim_tree_config = pcall(require, "nvim-tree.config");
  if not status_ok then
    return;
  end

  local tree_cb = nvim_tree_config.nvim_tree_callback;
  nvim_tree.setup({
    disable_netrw = true,
    open_on_setup = true,
    hijack_cursor = true,
    actions = {
      open_file = {
        resize_window = true,
      }
    },
    ignore_ft_on_setup = {
      "startify",
      "dashboard",
      "alpha",
    },
    renderer = {
      add_trailing = true,
      indent_markers = {
        enable = true,
        icons = {
          corner = "└ ",
          edge = "│ ",
          none = "  ",
        },
      },
    },
    filters = {
      dotfiles = true,
    },
    git = {
      enable = false,
      ignore = false,
      timeout = 500,
    },
    view = {
      mappings = {
        custom_only = false,
        list = {
          { key = "C", action = "cd" },
          { key = "s", action = "refresh" },
        },
      }
    }
  });

  vim.api.nvim_set_keymap("n", "<C-n>", ":NvimTreeFocus<CR>", { noremap = true });
end
