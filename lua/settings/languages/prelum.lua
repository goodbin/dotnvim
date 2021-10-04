--- settings/languages/prelum.lua

local M = {}

function M.plug(manager)
end

function M.setup()
    vim.cmd([[ autocmd BufRead,BufNewFile *.pre set filetype=prelum ]]);
    vim.cmd([[ autocmd BufReadPre,FileReadPre *.scad :let g:auto_save = 0 ]]);
end

return M

