-- settings/telescope.lua

function install(use)
  use("nvim-telescope/telescope.nvim");
end

function config()
  local status_ok, telescope = pcall(require, "telescope");
  if not status_ok then
    return;
  end

  local status_ok, builtin = pcall(require, "telescope.builtin");
  if not status_ok then
    return;
  end

  local opts = { noremap = true, silent = true };
  vim.keymap.set("n", "<leader>ff", builtin.find_files, opts);
  vim.keymap.set("n", "<leader>fg", builtin.live_grep, opts);
  vim.keymap.set("n", "<leader>fc", builtin.commands, opts);

  telescope.setup({
    defaults = {
      prompt_prefix = " ",
      selection_caret = " ",
      path_display = { "smart" },
    },
    pickers = {
    },
    extensions = {
    },
  });
end
