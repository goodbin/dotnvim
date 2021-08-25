-- vim-plug binding

-- local package = require("package")

local M = {}
local settings = {}
local plugins = {}

function M.setup(...)
    local ret = vim.fn['plug#begin'](...)
    if not ret then
        return ret
    end

    for k, p in pairs(plugins) do
        local opts = {}
        if p.options then
            opts = p.options
        end
        opts[vim.type_idx] = vim.types.dictionary
        ret = vim.fn['plug#'](p.name, opts)
    end
    if not ret then
        return ret
    end

    ret = vim.fn['plug#end']()
    if not ret then
        return ret
    end

--     local packpath = {package.path}
--     for k, v in pairs(vim.g.plugs) do
--         local p = v['dir'] .. "lua"
--         if path.exists(p) == 'directory' then
--             table.insert(packpath, p .. "/?.lua")
--             table.insert(packpath, p .. "/?/init.lua")
--         end
--     end
--     package.path = table.concat(packpath, ";")

    for k, v in pairs(settings) do
        v.setup()
    end
    return ret
end

function M.add(name, options)
    local plugin = {
        name = name,
        options = options,
    }
    table.insert(plugins, plugin)
end

function M.register(name)
    local _GB = getfenv(0)
    local P = {}
    setmetatable(P, {__index = _GB})
    setfenv(0, P)

    if require(name) then
        if P.plug then
            P.plug(M)
        end
        if P.setup then
            table.insert(settings, {
                name = name,
                setup = P.setup,
            })
        end
    end

    setfenv(0, _GB)
end

return M

