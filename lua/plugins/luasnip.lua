-- plugins/luasnip.lua

function install(use)
  use("L3MON4D3/LuaSnip");
end

function config()
  local status_ok, luasnip = pcall(require, "luasnip");
  if not status_ok then
    return;
  end

  local snip_dir = vim.fn.stdpath('config') .. "/luasnip";
  require("luasnip.loaders.from_vscode").load({
    paths = snip_dir
  });
end
