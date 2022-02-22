-- init.lua

local plug = require("utils/plugins");
local project = require("utils/project");

plug.register("plugins/options");
plug.register("plugins/impatient");
plug.register("plugins/keymaps");
plug.register("plugins/colorscheme");
plug.register("plugins/nvim-tree");
plug.register("plugins/lualine");
plug.register("plugins/gitsigns");
plug.register("plugins/editorconfig");
plug.register("plugins/whichkey");
plug.register("plugins/luasnip");
plug.register("plugins/treesitter");
plug.register("plugins/cmp");
plug.register("plugins/comment");
plug.register("plugins/autopairs");
plug.register("plugins/spellsitter");
plug.register("plugins/templates");
plug.register("plugins/languages");

project.config();

plug.startup(function()
  vim.cmd("filetype plugin indent on");
  vim.cmd("syntax on");
end);
