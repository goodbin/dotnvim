-- settings/completion.lua

function plug(manager)
    manager.add("hrsh7th/nvim-compe");
end

function setup()
    -- Show tab completion window
    vim.o.completeopt = "menuone,noinsert,noselect";
    vim.cmd [[ set shortmess+=c ]]

    require("compe").setup({
        enabled = true,
        autocomplete = true,
        debug = false,
        min_length = 1,
        preselect = "enable",
        throttle_time = 80,
        source_timeout = 200,
        incomplete_delay = 400,
        allow_prefix_unmatch = false,
        max_abbr_width = 100,
        max_kind_width = 100,
        max_menu_width = 100,
        documentation = true,

        source = {
            path = true,
            buffer = true,
            vsnip = true,
            nvim_lsp = true,
            nvim_lua = true,
        }
    })

    vim.api.nvim_set_keymap("i", "<CR>", "compe#confirm('<CR>')", {
        expr = true,
        noremap = true,
        silent = true
    })
    vim.api.nvim_set_keymap("i", "<C-e>", "compe#close('<C-e>')", {
        expr = true,
        noremap = true,
        silent = true
    })
    vim.api.nvim_set_keymap("i", "<C-n>", "compe#complete()", {
        expr = true,
        noremap = true,
        silent = true
    })
end

