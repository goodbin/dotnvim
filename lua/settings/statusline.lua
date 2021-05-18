-- settings/statusline.lua

function plug(manager)
    manager.add("hoob3rt/lualine.nvim")
end

function setup()
    require('lualine').setup({
        options = {
            theme = 'gruvbox'
        }
    })
end

