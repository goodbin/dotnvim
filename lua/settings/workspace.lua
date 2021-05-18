-- settings/workspace.lua

function plug(manager)
    manager.add("editorconfig/editorconfig-vim")
    manager.add("vim-scripts/vim-auto-save")
end

function setup()
    vim.g.EditorConfig_disable_rules = {'trim_trailing_whitespace'}

    vim.g.auto_save = 1
    vim.g.auto_save_in_insert_mode = 0
end

