-- plugins

local fn = vim.fn;
local configs = {}
local plugins = {}
local M = {}

local ensure_packer = function()
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1',
      'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd('packadd packer.nvim');
    return true
  end
  return false
end

function M.bootstrap()
  M.packer_bootstrap = ensure_packer();

  if M.packer_bootstrap then
    print("Installing packer, close and reopen Neovim...");
  end

  local status_ok, packer = pcall(require, "packer");
  if not status_ok then
    return false;
  end

  local status_ok, util = pcall(require, "packer.util");
  if not status_ok then
    return false;
  end

  packer.init({
    compile_path = util.join_paths(fn.stdpath("data"), "plugin", "packer_compiled.lua"),
    display = {
      open_fn = function()
        return util.float({ border = "rounded" })
      end,
    },
  });

  M.packer = packer;
  return true;
end

function M.startup(callback)
  local retval = M.packer.startup(function(use)
    use("wbthomason/packer.nvim");
    for _, p in pairs(plugins) do
      p.install(use, unpack(p.args));
    end
  end);

  if retval then
    for _, s in pairs(configs) do
      s.config(unpack(s.args));
    end

    if M.packer_bootstrap then
      retval.sync();
    end
    callback(M)
    return true;
  end
  return false;
end

function test(...)
  print(args[2])
end

function M.load(name, ...)
  local args = {...};
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
        args = args,
      });
    end
    if P.config then
      table.insert(configs, {
        name = name,
        config = P.config,
        args = args,
      })
    end
  else
    error("Error load module " .. name);
  end

  setfenv(0, _GB)
end

return M
