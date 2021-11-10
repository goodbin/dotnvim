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
            ['<C-n>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.mapping.select_next_item({
                        behavior = cmp.SelectBehavior.Insert,
                    })(fallback)
                else
                    cmp.mapping.complete()(fallback)
                end
            end, { "i", "s" }),
            ["<C-p>"] = cmp.mapping.select_prev_item(),
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
            ["<C-d>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ['<C-e>'] = cmp.mapping.close(),
            ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.mapping.select_next_item({
                        behavior = cmp.SelectBehavior.Insert,
                    })(fallback)
                elseif vim.fn["vsnip#available"]() == 1 then
                    feedkey("<Plug>(vsnip-expand-or-jump)", "")
                else
                    fallback()
                end
            end, { "i", "s" }),
            ["<S-Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.mapping.select_prev_item({
                        behavior = cmp.SelectBehavior.Insert,
                    })(fallback)
                elseif vim.fn["vsnip#jumpable"](-1) == 1 then
                    feedkey("<Plug>(vsnip-jump-prev)", "")
                else
                    fallback()
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

