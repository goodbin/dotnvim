-- settings/colorscheme

function install(use, ...)
  local args = {...};

  if vim.tbl_contains(args, "darkplus") then
    use("LunarVim/darkplus.nvim");
  end

  if vim.tbl_contains(args, "material") then
    use("sainnhe/gruvbox-material");
  end
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

function config(...)
  local args = {...};

  vim.opt.termguicolors = true;
  vim.opt.guifont = "monospace:h10";

  if vim.tbl_contains(args, "darkplus") then
    config_darkplus();
  end

  if vim.tbl_contains(args, "material") then
    config_material();
  end
end
