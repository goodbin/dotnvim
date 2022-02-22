-- plugins helper

local fn = vim.fn;
local M = {}
local configs = {}
local plugins = {}

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim";
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  });
  print("Installing packer close and reopen Neovim...");
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer");
if not status_ok then
  return;
end

local status_ok, util = pcall(require, "packer.util");
if not status_ok then
  return;
end

-- Have packer use a popup window
packer.init({
  compile_path = util.join_paths(fn.stdpath("data"), "plugin", "packer_compiled.lua"),
  display = {
    open_fn = function()
      return util.float({ border = "rounded" })
    end,
  },
});

function M.startup(callback)
  local retval = packer.startup(function(use)
    use("wbthomason/packer.nvim");             -- Have packer manage itself

    for _, p in pairs(plugins) do
      p.install(use);
    end

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
      packer.sync()
    end
  end);

  for _, s in pairs(configs) do
    s.config();
  end

  if callback then
    callback();
  end

  return retval;
end

function M.register(name)
  local _GB = getfenv(0)
  local P = {}
  setmetatable(P, {__index = _GB})
  setfenv(0, P)

  local status_ok, module = pcall(require, name);
  if status_ok then
    if P.install then
      table.insert(plugins, {
        name = name,
        install = P.install,
      });
    end
    if P.config then
      table.insert(configs, {
        name = name,
        config = P.config,
      })
    end
  else
    print("Error load module " .. name);
  end

  setfenv(0, _GB)
end

return M
