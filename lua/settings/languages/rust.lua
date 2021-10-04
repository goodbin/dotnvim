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
        -- ["rust-analyzer"] = {
        --     assist = {
        --         importMergeBehavior = "last",
        --         importPrefix = "by_self",
        --         allFeatures = true,
        --     },
        --     cargo = {
        --         loadOutDirsFromCheck = true,
        --     },
        --     procMacro = {
        --         enable = true,
        --     },
        -- },
    });
end

return M

