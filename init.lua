-- init.lua

local plug = require("utils/plugins");

local packer = plug.bootstrap();
if not packer then
  return;
end

plug.register("plugins/plugins");
plug.register("plugins/options");
plug.register("plugins/impatient");
plug.register("plugins/keymaps");
plug.register("plugins/colorscheme");
plug.register("plugins/nvim-tree");
plug.register("plugins/lualine");
plug.register("plugins/gitsigns");
plug.register("plugins/editorconfig");
plug.register("plugins/treesitter");
plug.register("plugins/indent");
plug.register("plugins/comment");
plug.register("plugins/autopairs");
plug.register("plugins/luasnip");
plug.register("plugins/cmp");
plug.register("plugins/templates");
plug.register("plugins/languages");
plug.register("plugins/telescope");
-- plug.register("plugins/spellsitter");
plug.register("plugins/whichkey");

local status_ok, project = pcall(require, "utils/project");
if status_ok then
  project.config();
end

plug.startup(packer, function()
  vim.cmd("filetype plugin indent on");
  vim.cmd("syntax on");
end);

