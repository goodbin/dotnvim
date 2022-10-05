-- core/utils

local M = {};

function M.script_path()
   local str = debug.getinfo(2, "S").source:sub(2)
   return str:match("(.*/)")
end

function M.load_module(name, callback)
  local out = {};
  local _GB = getfenv(0)
  local P = {}
  setmetatable(P, {__index = _GB})
  setfenv(0, P)
  local status_ok, module = pcall(require, name);
  if status_ok then
    callback(name, out, P);
  end
  setfenv(0, _GB);
  return out;
end

return M;
