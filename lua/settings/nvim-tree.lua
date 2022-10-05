-- settings/nvim-tree.lua

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
    create_in_closed_folder = true,
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
      group_empty = true,
      add_trailing = false,
      indent_markers = {
        enable = false,
        icons = {
          corner = "└ ",
          edge = "│ ",
          none = "  ",
        },
      },
      icons = {
        webdev_colors = true,
        git_placement = "after",
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
    diagnostics = {
      enable = false,
    },
    view = {
      adaptive_size = true,
      mappings = {
        custom_only = false,
        list = {
          { key = "C", action = "cd" },
          { key = "s", action = "refresh" },
        },
      }
    }
  });

  vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { noremap = true });
end
