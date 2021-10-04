-- settings/theme.lua

function plug(manager)
    manager.add("morhetz/gruvbox")
    manager.add("kyazdani42/nvim-web-devicons")
end

function setup()
    if (vim.fn.empty("$TMUX")) then
      if (vim.fn.has("nvim")) then
        vim.g["$NVIM_TUI_ENABLE_TRUE_COLOR"] = 1
      end
    end

    vim.g.background = "dark";
    vim.g.gruvbox_italic = 1;
    vim.g.gruvbox_termcolors = 256;

    vim.cmd("colorscheme gruvbox")

    vim.cmd([[hi! link LspDiagnosticsVirtualTextError CocDiagnosticsError]]);
    vim.cmd([[hi! link LspDiagnosticsVirtualTextWarning CocDiagnosticsWarning]]);
    vim.cmd([[hi! link LspDiagnosticsVirtualTextInformation CocDiagnosticsInfo]]);
    vim.cmd([[hi! link LspDiagnosticsVirtualTextHint CocDiagnosticsHint]]);
end

