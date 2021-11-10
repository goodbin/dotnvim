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
    vim.g.nvim_tree_add_trailing = 1;
    vim.g.nvim_tree_icon_padding = ' ';
    vim.g.nvim_tree_indent_markers = 1;

    vim.g.nvim_tree_show_icons = {
        git = 0,
        folders = 1,
        files = 1,
        folder_arrows = 0,
    }
    vim.g.nvim_tree_icons = {
        default = '',
        symlink = '',
        git = {
            unstaged = "✗",
            staged = "✓",
            unmerged = "",
            renamed = "➜",
            untracked = "★",
            deleted = "",
            ignored = "◌"
        },
        folder = {
            arrow_open = "",
            arrow_closed = "",
            default = "",
            open = "",
            empty = "",
            empty_open = "",
            symlink = "",
            symlink_open = "",
        },
        lsp = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        }
    }
    vim.api.nvim_set_keymap("n", "<C-n>", ":NvimTreeFocus<CR>", { noremap = true })

    local tree_cb = require('nvim-tree.config').nvim_tree_callback
    local mappings = require("nvim-tree.view").View.mappings;

    for i, b in ipairs(mappings) do
        if b.key == "s" then
            table.remove(mappings, i);
        end
    end

    require("nvim-tree").setup({
        disable_netrw = true,
        open_on_setup = true,
        hijack_cursor = true,
        update_focused_file = {
            enable = false,
            update_cwd = false,
        },
        diagnostics = {
            enable = false,
        },
        filters = {
            dotfiles = true,
        },
        view = {
            width = 30,
            side = "left",
            auto_resize = true,
            mappings = {
                custom_only = false,
                list = {
                    { key = "C",    cb = tree_cb("cd") },
                },
            }
        }
    });
end
