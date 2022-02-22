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

  vim.g.nvim_tree_add_trailing = 1;
  vim.g.nvim_tree_indent_markers = 1;

  local tree_cb = nvim_tree_config.nvim_tree_callback;
  nvim_tree.setup({
    disable_netrw = true,
    open_on_setup = true,
    open_on_tab = false,
    hijack_cursor = true,
    update_cwd = false,
    ignore_ft_on_setup = {
      "startify",
      "dashboard",
      "alpha",
    },
    show_icons = {
      git = 0,
      folders = 1,
      files = 1,
      folder_arrows = 1,
      tree_width = 30,
    },
    system_open = {
      cmd = nil,
      args = {},
    },
    update_focused_file = {
      enable = false,
      update_cwd = false,
    },
    git = {
      enable = false,
      ignore = true,
      timeout = 500,
    },
    diagnostics = {
      enable = false,
    },
    filters = {
      dotfiles = false,
      custom = {},
    },
    view = {
      width = 30,
      side = "left",
      signcolumn = "yes",
      hide_root_folder = false,
      auto_resize = true,
      number = false,
      relativenumber = false,
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
