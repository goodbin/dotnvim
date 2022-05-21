-- plugins/colorscheme

function install(use)
  use("goodbin/darkplus.nvim");
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

  local function hi(group, props)
    local bg = props.bg == nil and "" or "guibg=" .. props.bg;
    local fg = props.fg == nil and "" or "guifg=" .. props.fg;
    local style = props.style == nil and "" or "gui=" .. props.style;

    local cmd = table.concat({
        "highlight!", group, bg, fg, style
    }, " ");

    vim.api.nvim_command(cmd);
  end

  hi("Whitespace", { fg = C.cursor_fg });
end

function config()
  vim.opt.termguicolors = true;
  -- config_material();
  config_darkplus();
end
