--- settings/languages/rust.lua

local M = {}

function M.plug(manager)
    manager.add("rust-lang/rust.vim");
end

function M.setup()
    vim.g.rust_recommended_style = true;
    vim.g.rustfmt_fail_silently = true;
    vim.g.syntastic_rust_checkers = {};
    vim.g.rust_fold = true;
end

function M.lsp_setup(caps, on_attach)
    local nvim_lsp = require("lspconfig");
    nvim_lsp.rust_analyzer.setup({
        capabilities = caps,
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 150,
        },
        settings = {
            ["rust-analyzer"] = {
                assist = {
                },
                checkOnSave = {
                    enable = false,
                },
                cargo = {
                    loadOutDirsFromCheck = true,
                    allFeatures = true,
                    autoreload = true,
                },
                completion = {
                    autoimport = {
                        enable = false
                    },
                },
                procMacro = {
                    enable = true,
                },
            },
        },
    });
end

return M

