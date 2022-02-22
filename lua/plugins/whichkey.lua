--- plugins/whichkey.lua

function install(use)
  use("folke/which-key.nvim");
end

function config()
  local status_ok, which_key = pcall(require, "which-key");
  if not status_ok then
    return;
  end

  local setup = {

  };

  local mappings = {
  };

  local opts = {
  };

  which_key.setup(setup);
  which_key.register(mappings, opts)
end
