--- Language Server Protocol client for D language

local configs = require('nvim_lsp/configs')
local util = require('nvim_lsp/util')

configs.served = {
    default_config = {
        cmd = {"/home/oleg/Develop/Vendor/serve-d/serve-d",
                        "--require", "D", "--provide", "http"},
        filetypes = {'d'},
        root_dir = util.root_pattern('dub.sdl', 'dub.json'),
    };
}

