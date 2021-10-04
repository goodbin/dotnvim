--- settings/snippets.lua

local dub = require("utils.dub");

local T = {}

function plug(manager)
    manager.add("hrsh7th/vim-vsnip");
    manager.add("aperezdc/vim-template");
    manager.add("nvim-lua/plenary.nvim");
end

function T.GetCopyright()
    local copy = vim.g.copyright
    if copy then
        return copy
    end
    return ""
end


function T.GetModule()
    local Path = require("plenary.path");
    local result = vim.fn.expand('%:r')
    local project_path = Path:new(vim.loop.cwd())
    local prefixes = {}

    if dub.is_dub_project(project_path) then
        local dub_path = dub.get_dub_root(project_path, Path:new(vim.fn.expand('%:p:h')));
        local file = vim.fn.expand('%:p:r');
        if file:len() > dub_path.filename:len() then
            result = file:sub(dub_path.filename:len()+2);
        end

        local importPaths = dub.get_dub_imports(dub_path);
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

function user_variable(name, func_name)
    _G[func_name] = T[func_name];
    vim.api.nvim_exec(string.format([[ function! %s()
            return luaeval('_G.%s()')
        endfunction ]], func_name, func_name), false);
    return {name, func_name}
end

function setup()
    --- VSnip config
    vim.g.vsnip_snippet_dir = vim.fn.stdpath('config') .. "/vsnip";

    --- Templates
    vim.g.templates_no_autocmd = 0;
    vim.g.templates_directory = { vim.fn.stdpath('config') .. "/templates" };
    vim.g.templates_global_name_prefix = "@";
    vim.g.templates_debug = 0;
    vim.g.templates_user_variables = {
        user_variable("COPYRIGHT", "GetCopyright"),
        user_variable("MODULE", "GetModule"),
    }
end

