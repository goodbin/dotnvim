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

local function load_config(name, path)
  if path:exists() and path:is_file() then
    local st, res = pcall(json_decode, path:read());
    if st then
      load_variables(name, res);
    else
      print("Error load project file. " .. res);
    end
  end
end

local function load_project_config()
  local path = path:new(vim.fn.getcwd());
  local file_name = ".project.json";
  load_config("project", path:joinpath(file_name));
end

local function load_user_config()
  local path = path:new(vim.fn.stdpath("config"));
  local file_name = ".user.json";
  load_config("user", path:joinpath(file_name));
end

function M.bootstrap()
  load_project_config();
  load_user_config();
end

return M;
