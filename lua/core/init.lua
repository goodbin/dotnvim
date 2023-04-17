local plugins = require("core/plugins")
local bootstrap = require("core/bootstrap")

-- Start neovim
local function startup(callback)
  bootstrap.lazy()
  require("core/options")
  plugins.startup(callback)
end

return {
  bootstrap = bootstrap,
  startup = startup,
}
