--- project.lua

local pa = require("plenary.async");
local path = require("plenary.path");

local M = {};

local json_decode
if vim.json then
  json_decode = vim.json.decode
else
  json_decode = vim.fn.json_decode
end

local function load_variables(prefix, data)
  if not type(data) == "table" then
    return;
  end

  for key, val in pairs(data) do
    local option = prefix .. "_" .. key;
    vim.g[option] = val;
  end
end

local function load_config(name)
  local path = path:new(vim.fn.getcwd());
  local file_name = "." .. name .. ".json";
  path = path:joinpath(file_name);

  if path:exists() and path:is_file() then
    local st, res = pcall(json_decode, path:read());
    if st then
      load_variables(name, res);
    else
      print("Error load project file. " .. res);
    end
  end
end

function M.config()
  load_config("project");
  load_config("user");
end

return M;
