-- settings/keymapping.lua

function plug(manager)
    manager.add("lyokha/vim-xkbswitch")
end

function setup()
    vim.g.mapleader = ","

    vim.g.XkbSwitchEnabled = 1
    vim.g.XkbSwitchIMappings = {"ru"}
    vim.g.XkbSwitchLoadRIMappings = 0
    vim.g.XkbSwitchSkipGhKeys = {"gH", "gh", "g"}

    vim.o.keymap = "russian-jcukenwin"
    -- Reset lang
    vim.o.iminsert = 0
    -- Reset lang in search
    vim.o.imsearch = 0

    -- Learn it the hard way
    vim.api.nvim_set_keymap("", "<up>", "<nop>", {})
    vim.api.nvim_set_keymap("", "<down>", "<nop>", {})
    vim.api.nvim_set_keymap("", "<left>", "<nop>", {})
    vim.api.nvim_set_keymap("", "<rigth>", "<nop>", {})

    -- Отключаем переход в Ex mode
    vim.api.nvim_set_keymap("", "Q", "<nop>", {})

    vim.api.nvim_set_keymap("n", "<C-h>", ":wincmd h<CR>", {silent = true})
    vim.api.nvim_set_keymap("n", "<C-j>", ":wincmd j<CR>", {silent = true})
    vim.api.nvim_set_keymap("n", "<C-k>", ":wincmd k<CR>", {silent = true})
    vim.api.nvim_set_keymap("n", "<C-l>", ":wincmd l<CR>", {silent = true})

    -- turn off search highlight
    vim.api.nvim_set_keymap("n", "<leader><space>", ":nohlsearch<CR>", {silent = true})

    -- buffers
    vim.api.nvim_set_keymap("", "bn", ":bn<CR>", {silent = true})
    vim.api.nvim_set_keymap("", "bp", ":bp<CR>", {silent = true})
end

