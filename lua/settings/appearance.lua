-- settings/theme.lua

function plug(manager)
    manager.add("kyazdani42/nvim-web-devicons");
    manager.add("morhetz/gruvbox")
end

function setup()
    if (vim.fn.empty("$TMUX")) then
      if (vim.fn.has("nvim")) then
        vim.g["$NVIM_TUI_ENABLE_TRUE_COLOR"] = 1
      end
    end

    vim.o.termguicolors = true;
    vim.g.background = "dark";
    vim.cmd("colorscheme gruvbox")

    vim.cmd([[hi! link LspDiagnosticsVirtualTextError CocDiagnosticsError]]);
    vim.cmd([[hi! link LspDiagnosticsVirtualTextWarning CocDiagnosticsWarning]]);
    vim.cmd([[hi! link LspDiagnosticsVirtualTextInformation CocDiagnosticsInfo]]);
    vim.cmd([[hi! link LspDiagnosticsVirtualTextHint CocDiagnosticsHint]]);

    vim.cmd([[hi! GruvboxRed guifg=#D75F5F ctermfg=167 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE]]);
    vim.cmd([[hi! GruvboxBg0 guifg=#262626 ctermfg=235 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE]]);
    vim.cmd([[hi! GruvboxGreen guifg=#AFAF00 ctermfg=142 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE]]);
    vim.cmd([[hi! Normal guifg=#ebdbb2 ctermfg=223 guibg=#262626 ctermbg=235 gui=NONE cterm=NONE]])
    vim.cmd([[hi GruvboxAqua guifg=#87AF87 ctermfg=108 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE]])
end

