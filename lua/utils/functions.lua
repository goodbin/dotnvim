-- settings/functions.lua
local package = require("package")

local module = {}
local api = vim.api
local fn = vim.fn
local uv = vim.loop


function module.WinMove(key)
    api.nvim_command("wincmd "..key)
end


-- Return Copy
function module.GetCopyright()
    local copy = vim.g.copyright
    if copy then
        return copy
    end
    return ""
end


local function is_dub_project(dub_dir)
    local dub_sdl_file = module.path.join(dub_dir, "dub.sdl")
    local dub_json_file = module.path.join(dub_dir, "dub.json")
    return module.path.exists(dub_sdl_file) == 'file'
        or module.path.exists(dub_json_file) == 'file'
end


local function get_dub_root(pro_path, file_path)
    while file_path:len() > pro_path:len() do
        file_path = module.path.dirname(file_path)
        if is_dub_project(file_path) then
            return file_path
        end
    end
    return file_path
end


local function get_dub_imports(dub_path)
    if not fn.executable('dub') then
        return nil
    end

    local describe = fn.system('dub describe --verror --vquiet --root=' .. dub_path)
    if vim.v.shell_error > 0 then
        return nil
    end

    local json = fn.json_decode(describe)
    local rootPackage = json["rootPackage"]
    if not rootPackage then
        return nil
    end

    local packs = json["packages"]
    if not vim.tbl_islist(packs) then
        return nil
    end

    local importPaths = {}
    for i, p in pairs(packs) do
        if p["name"] == rootPackage then
            importPaths = p["importPaths"]
        end
    end

    if not vim.tbl_islist(importPaths) then
        return nil
    end
    return importPaths
end


-- Return D module
function module.GetModule()
    local result = fn.expand('%:r')
    local project_path = uv.cwd()
    local prefixes = {}

    if is_dub_project(project_path) then
        local dub_path = get_dub_root(project_path, fn.expand('%:p:h'))
        local path = fn.expand('%:p:r')
        if path:len() > dub_path:len() then
            result = path:sub(dub_path:len()+2)
        end

        local importPaths = get_dub_imports(dub_path)
        if importPaths then
            for i, ip in pairs(importPaths) do
                if not (ip == ".") then
                    table.insert(prefixes, ip)
                end
            end
        else
            table.insert(prefixes, "source/")
            table.insert(prefixes, "tests/")
        end
    end

    for i, p in pairs(prefixes) do
        result = result:gsub('^'.. p, "")
    end

    result = result:gsub('/package$', "")
    return result:gsub("/", ".")
end


-- Path functions
module.path = (function()
    local DIR_SEP = package.config:sub(1, 1)

    local function exists(filename)
        local stat = uv.fs_stat(filename)
        return stat and stat.type or false
    end

    local function _remove_dir_end(P)
        return (string.gsub(P, '[\\/]+$', ''))
    end

    local function _splitpath(P)
        return string.match(P,"^(.-)[\\/]?([^\\/]*)$")
    end

    local function path_join(...)
        local t,n = vim.tbl_flatten({...}), select('#', ...)
        table.foreach(t, function(k, v)
            t[k] = _remove_dir_end(v)
        end)
        return table.concat(t, DIR_SEP)
    end

    local function dirname(P)
        return (_splitpath(P))
    end

    return {
        exists = exists,
        join = path_join,
        dirname = dirname
    }
end)()


return module

