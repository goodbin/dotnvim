-- plugins/colorscheme

function install(use)
  use("LunarVim/darkplus.nvim");
  use("sainnhe/gruvbox-material");
end

function config_material()
  vim.g.background = "dark";
  vim.g.gruvbox_material_background = 'hard';
  vim.g.gruvbox_material_disable_italic_comment = true;
  vim.g.gruvbox_material_palette = 'original';
  vim.g.gruvbox_material_diagnostic_virtual_text = 'grey';
  vim.g.gruvbox_material_diagnostic_line_highlight = true;
  vim.g.gruvbox_material_sign_column_background = 'none';
  vim.cmd("colorscheme gruvbox-material");
end

function config_darkplus()
  vim.g.italic_keywords = true;
  vim.g.background = "dark";
  vim.cmd("colorscheme darkplus");
end

function config()
  vim.opt.termguicolors = true;
  vim.opt.guifont = "monospace:h17";
  -- config_material();
  config_darkplus();
end
