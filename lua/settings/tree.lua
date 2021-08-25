-- settings/tree.lua

function plug(manager)
    manager.add("kyazdani42/nvim-tree.lua");
end

function setup()
    -- Netrw settings
    vim.g.netrw_liststyle = 3
    vim.g.netrw_banner = 0
    vim.g.netrw_browse_split = 4
    vim.g.netrw_altv = 1
    vim.g.netrw_winsize = 20

    -- nvim-tree
    vim.api.nvim_set_keymap("n", "<C-n>", ":NvimTreeToggle<CR>", { noremap = true })

    vim.g.nvim_tree_width = 30;
    vim.g.nvim_tree_auto_open = 1;
    -- vim.g.nvim_tree_follow = 1;
    vim.g.nvim_tree_indent_markers = 1;
    vim.g.nvim_tree_git_hl = 1;
    -- vim.g.nvim_tree_highlight_opened_files = 1;
    vim.g.nvim_tree_add_trailing = 1;
    vim.g.nvim_tree_lsp_diagnostics = 1;
end

