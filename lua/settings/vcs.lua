--- settings/vcs.lua

function plug(manager)
    manager.add("mhinz/vim-signify")
end

function setup()
    vim.o.updatetime = 100
    vim.g.signify_sign_change = "~"
end

