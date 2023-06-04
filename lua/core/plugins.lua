local M = {}
local plugins = {}

local utils = require("core/utils")

-- Load lua module
local function load_module(path)
  local _GB = getfenv(0)
  local P = {}

  setmetatable(P, { __index = _GB })
  setfenv(0, P)

  local status, val = pcall(require, path)
  if not status then
    result = { false, val }
  else
    if type(val) == "table" then
      P = vim.tbl_extend("force", P, val)
      setmetatable(P, { __index = _GB })
    else
      P["_module"] = val
    end
    result = { true, P }
  end

  setfenv(0, _GB)
  return unpack(result)
end

-- Load plugin file
function M.load(path, ...)
  local plugin = vim.tbl_get(plugins, path)
  if plugin then
    return plugin
  end

  local status, module = load_module(path)
  if not status then
    error(module)
  end

  module["_name"] = path
  module["_opts"] = { ... }

  plugins[path] = module
  return module
end

-- Get function from plugin by name
local function get_function_from_name(plugin, name)
  local fn = vim.tbl_get(plugin, name)
  if not fn then
    return function() utils.error("Not found function " .. name .. " in " .. plugin._name) end
  end
  return fn
end

-- Startup plugins
function M.startup(callback)
  local specs = {}
  local function register(spec)
    table.insert(specs, spec) 
  end

  register({ "nvim-lua/plenary.nvim" })

  for _, p in pairs(plugins) do
    local use = function(spec)
      if type(spec.config) == "string" then
        spec.config = get_function_from_name(p, spec.config)
      end
      if type(spec.init) == "string" then
        spec.init = get_function_from_name(p, spec.init)
      end
      spec.opts = p._opts
      if not spec.config then
        spec.config = function() end
      end
      register(spec)
    end
    p.install(use, unpack(p._opts))
  end

  for _, p in pairs(plugins) do
    if type(p.init) == "function" then
      p.init(p._opts)
    end
  end

  require("lazy").setup({
    spec = specs,
    performance = {
      rtp = {
        disabled_plugins = {
          "gzip",
          "matchit",
          "matchparen",
          "netrwPlugin",
          "tarPlugin",
          "tohtml",
          "tutor",
          "zipPlugin",
        }
      }
    }
  })

  if type(callback) == "function" then
    callback()
  end

  for _, p in pairs(plugins) do
    if type(p.config) == "function" then
      p.config(p._opts)
    end
  end
end

return M
