-- settings/theme.lua

function plug(manager)
    manager.add("morhetz/gruvbox")
    manager.add("ryanoasis/vim-devicons")
    manager.add("kyazdani42/nvim-web-devicons")
    manager.add("yamatsum/nvim-nonicons")
end

function setup()
    if (vim.fn.empty("$TMUX")) then
      if (vim.fn.has("nvim")) then
        vim.g["$NVIM_TUI_ENABLE_TRUE_COLOR"] = 1
      end
    end

    vim.g.background = "dark";
    vim.g.gruvbox_italic = 1;
    vim.g.gruvbox_contrast_dark = "hard";
    vim.g.gruvbox_termcolors = 256;

    vim.cmd("colorscheme gruvbox")

    vim.g.webdevicons_enable = 1
    vim.g.webdevicons_enable_nerdtree = 1
    vim.g.DevIconsEnableFoldersOpenClose = 1
    vim.g.webdevicons_conceal_nerdtree_brackets = 1
    vim.g.WebDevIconsNerdTreeAfterGlyphPadding = " "
    vim.g.WebDevIconsNerdTreeBeforeGlyphPadding = " "

    vim.cmd([[hi! link LspDiagnosticsVirtualTextError CocDiagnosticsError]]);
    vim.cmd([[hi! link LspDiagnosticsVirtualTextWarning CocDiagnosticsWarning]]);
    vim.cmd([[hi! link LspDiagnosticsVirtualTextInformation CocDiagnosticsInfo]]);
    vim.cmd([[hi! link LspDiagnosticsVirtualTextHint CocDiagnosticsHint]]);
end

