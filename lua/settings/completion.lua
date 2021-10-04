-- settings/completion.lua

function plug(manager)
    manager.add("hrsh7th/nvim-cmp");
    manager.add("hrsh7th/cmp-nvim-lsp");
    manager.add("hrsh7th/cmp-buffer");
    manager.add("hrsh7th/cmp-path");
    manager.add("hrsh7th/cmp-vsnip");
end

function setup()
    -- Show tab completion window
    vim.o.completeopt = "menuone,noinsert,noselect";
    vim.cmd [[ set shortmess+=c ]]

    local has_words_before = function()
        if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
            return false
        end
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    local feedkey = function(key, mode)
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
    end

    local cmp = require("cmp");
    cmp.setup({
        preselect = true,
        completion = {
            autocomplete = false,
            completeopt = 'menu,menuone,noinsert',
        },
        snippet = {
            expand = function(args)
                vim.fn["vsnip#anonymous"](args.body)
            end,
        },
        mapping = {
            ["<C-p>"] = cmp.mapping.select_prev_item(),
            ["<C-n>"] = cmp.mapping.complete(),
            ["<C-d>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ['<C-e>'] = cmp.mapping.close(),
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
            ["<Tab>"] = cmp.mapping(function(fallback)
                if vim.fn.pumvisible() == 1 then
                    feedkey("<C-n>", "n")
                elseif vim.fn["vsnip#available"]() == 1 then
                    feedkey("<Plug>(vsnip-expand-or-jump)", "")
                elseif has_words_before() then
                    cmp.complete()
                else
                    fallback()
                end
            end, { "i", "s" }),

            ["<S-Tab>"] = cmp.mapping(function()
                if vim.fn.pumvisible() == 1 then
                    feedkey("<C-p>", "n")
                elseif vim.fn["vsnip#jumpable"](-1) == 1 then
                    feedkey("<Plug>(vsnip-jump-prev)", "")
                end
            end, { "i", "s" }),
        },
        sources = {
            { name = "nvim_lsp" },
            { name = "vsnip" },
            { name = "buffer" },
            { name = "path" },
        }
    })
end

