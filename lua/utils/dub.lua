--- utils/dub.lua

local M = {}

function M.is_dub_project(dub_path)
    local dub_sdl_file = dub_path:joinpath("dub.sdl");
    local dub_json_file = dub_path:joinpath("dub.json");
    return dub_sdl_file:is_file() or dub_json_file:is_file()
end

function M.get_dub_root(pro_path, file_path)
    local Path = require("plenary.path");
    while file_path.filename:len() > pro_path.filename:len() do
        file_path = Path:new(file_path:parent());
        if M.is_dub_project(file_path) then
            return file_path
        end
    end
    return file_path
end

function M.get_dub_imports(dub_path)
    if not vim.fn.executable('dub') then
        return nil
    end

    local describe = vim.fn.system('dub describe --verror --vquiet --root=' .. dub_path.filename)
    if vim.v.shell_error > 0 then
        return nil
    end

    local json = vim.fn.json_decode(describe)
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

return M

