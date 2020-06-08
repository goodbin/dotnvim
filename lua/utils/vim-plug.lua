-- vim-plug binding

local package = require("package")
local functions = require("utils/functions")

local M = {}
local settings = {}
local plugins = {}

function M.setup(...)
    local ret = vim.fn['plug#begin'](...)
    if not ret then return ret end

    for k, opts in pairs(plugins) do
        local repo = table.remove(opts, 1)
        opts[vim.type_idx]=vim.types.dictionary
        ret = vim.fn['plug#'](repo, opts)
    end
    if not ret then return ret end

    ret = vim.fn['plug#end']()
    if not ret then return ret end

    local packpath = {package.path}
    for k, v in pairs(vim.g.plugs) do
        local p = v['dir'] .. "lua"
        if functions.path.exists(p) == 'directory' then
            table.insert(packpath, p .. "/?.lua")
            table.insert(packpath, p .. "/?/init.lua")
        end
    end
    package.path = table.concat(packpath, ";")

    for k, v in pairs(settings) do
        if v == 'vim' then
            vim.api.nvim_command('runtime '..k..'.'..v)
        elseif v == 'lua' then
            require(k)
        end
    end
    return ret
end


function M.register(...)
    local t, n = {...}, select('#', ...)
    for k, b in pairs(t) do
        if type(b) == 'table' then
            table.insert(plugins, b)
        elseif type(b) == 'string' and k == n then
            local name = vim.fn.fnamemodify(b, ':r')
            settings[name] = vim.fn.fnamemodify(b, ':e')
        end
    end
end

return M

