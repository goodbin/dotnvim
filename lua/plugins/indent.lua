function install(use)
  use({ "lukas-reineke/indent-blankline.nvim", config = "ident_config" })
end

function ident_config()
  local indent_blankline = require("indent_blankline")

  indent_blankline.setup({
    show_current_context = true,
    show_trailing_blankline_indent = false,
    use_treesitter = true,
    char = "▏",
    context_char = "▏",
    filetype_exclude = {
      "help",
      "startify",
      "aerial",
      "alpha",
      "dashboard",
      "packer",
      "neogitstatus",
      "NvimTree",
      "neo-tree",
      "Trouble",
    },
    buftype_exclude = {
      "terminal",
      "nofile",
    },
    context_highlight_list = {
      "IndentBlanklineIndent1",
      "IndentBlanklineIndent2",
      "IndentBlanklineIndent3",
      "IndentBlanklineIndent4",
      "IndentBlanklineIndent5",
      "IndentBlanklineIndent6",
    },
  })

  local hl = vim.api.nvim_set_hl
  hl(0, "IndentBlanklineIndent1", { fg = "#E06C75" })
  hl(0, "IndentBlanklineIndent2", { fg = "#E5C07B" })
  hl(0, "IndentBlanklineIndent3", { fg = "#98C379" })
  hl(0, "IndentBlanklineIndent4", { fg = "#56B6C2" })
  hl(0, "IndentBlanklineIndent5", { fg = "#61AFEF" })
  hl(0, "IndentBlanklineIndent6", { fg = "#C678DD" })
end
