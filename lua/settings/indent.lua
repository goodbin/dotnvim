-- settings/indent

function install(use)
  use("lukas-reineke/indent-blankline.nvim");
end

function config()
  local status_ok, indent_blankline = pcall(require, "indent_blankline");
  if not status_ok then
    return;
  end

  indent_blankline.setup({
    show_current_context = true,
    show_trailing_blankline_indent = false,
    use_treesitter = true,
    buftype_exclude = { "terminal", "nofile" },
    filetype_exclude = {
      "help",
      "packer",
      "NvimTree",
    },
    context_highlight_list = {
      "IndentBlanklineIndent1",
      "IndentBlanklineIndent2",
      "IndentBlanklineIndent3",
      "IndentBlanklineIndent4",
      "IndentBlanklineIndent5",
      "IndentBlanklineIndent6",
    },
  });

  vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
  vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
  vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
  vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
  vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
  vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]
end
