local core = require("core")
local plug = require("core/plugins")

plug.load("plugins/impatient")
plug.load("plugins/appearance", "darkplus")
plug.load("plugins/mappings")
plug.load("plugins/explorer")
plug.load("plugins/treesitter")
plug.load("plugins/comment")
plug.load("plugins/gitsigns")
plug.load("plugins/snippets")
plug.load("plugins/templates")
plug.load("plugins/cmp")
plug.load("plugins/languages")
plug.load("plugins/indent")

-- plug.load("settings/statusline")
-- plug.load("settings/enhancer")
-- plug.load("settings/autopairs")
-- plug.load("settings/telescope")
-- plug.load("settings/buffers")

core.startup(function()
  local status_ok, project = pcall(require, "core/project")
  if status_ok then
    project.bootstrap()
  end
end)
