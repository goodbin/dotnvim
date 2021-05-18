--- settings/languages/init.lua

local rust_lang = require("settings.languages.rust");
local flutter_lang = require("settings.languages.flutter");
local d_lang = require("settings.languages.dlang");

local languages = {
    rust_lang,
    flutter_lang,
    d_lang,
};

function plug(manager)
    manager.add("neovim/nvim-lspconfig");
    manager.add("cespare/vim-toml");

    for _, lang in ipairs(languages) do
        lang.plug(manager);
    end
end

function setup()
    vim.cmd([[ autocmd BufRead,BufNewFile *.pre set filetype=prelum ]]);
    vim.cmd([[ autocmd BufReadPre,FileReadPre *.scad :let g:auto_save = 0 ]]);

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities.textDocument.completion.completionItem.resolveSupport = {
        properties = {
            'documentation',
            'detail',
            'additionalTextEdits',
        }
    }

    local on_attach = function(client)
        local function buf_set_keymap(...)
            vim.api.nvim_buf_set_keymap(bufnr, ...)
        end
        local function buf_set_option(...)
            vim.api.nvim_buf_set_option(bufnr, ...)
        end
        buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc");

        -- Mappings
        local opts = {noremap = true, silent = true};
        buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts);
        buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts);
        buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts);
        buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts);
        buf_set_keymap("n", "K",  "<cmd>lua vim.lsp.buf.hover()<CR>", opts);
        buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts);
        buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts);
        buf_set_keymap("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts);

        vim.api.nvim_exec([[
            augroup lsp_document_diagnostics
            autocmd! * <buffer>
            autocmd CursorHold <buffer> lua vim.lsp.diagnostic.show_line_diagnostics()
            augroup END
        ]], false);
    end

    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = {
                spacing = 2,
                prefix = "",
                severity_limit = "Warning",
            },
            signs = true,
            update_in_insert = false,
        }
    );

    vim.fn.sign_define('LspDiagnosticsSignError', {
        text = "",
        texthl = "GruvboxRedSign",
    });
    vim.fn.sign_define('LspDiagnosticsSignWarning', {
        text = "",
        texthl = "GruvboxOrangeSign",
    });
    vim.fn.sign_define('LspDiagnosticsSignInformation', {
        text = "",
        texthl = "GruvboxYellowSign",
    });
    vim.fn.sign_define('LspDiagnosticsSignHint', {
        text = "",
        texthl = "GruvboxBlueSign",
    });

    for _, lang in ipairs(languages) do
        lang.setup();
        if lang.lsp_setup then
            lang.lsp_setup(capabilities, on_attach);
        end
    end
end

