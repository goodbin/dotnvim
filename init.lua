-- init.lua

local plug = require("core/plugins");
if not plug.bootstrap() then
  error("Failed load plugin system");
  return;
end

plug.load("settings/common");
plug.load("settings/impatient");
plug.load("settings/keymaps");
plug.load("settings/colorscheme", "darkplus");
plug.load("settings/nvim-tree");
plug.load("settings/lualine");
plug.load("settings/gitsigns");
plug.load("settings/editorconfig");
plug.load("settings/treesitter");
plug.load("settings/indent");
plug.load("settings/comment");
plug.load("settings/luasnip");
plug.load("settings/cmp");
plug.load("settings/autopairs");
plug.load("settings/templates");
plug.load("settings/telescope");
plug.load("settings/languages");

local status_ok, project = pcall(require, "core/project");
if status_ok then
  project.bootstrap();
end

plug.startup(function()
  vim.cmd("filetype plugin indent on");
  vim.cmd("syntax on");
end);
