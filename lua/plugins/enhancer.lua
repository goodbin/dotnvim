-- settings/enhancer

function install(use)
  use({
    "rcarriga/nvim-notify",
    event = "UIEnter",
    config = "config_notify",
  })
  use({
    "stevearc/dressing.nvim",
    event = "UIEnter",
    config = "config_dressing",
  })
end

function config_notify()
  local notify = require("notify")

  notify.setup({
    stages = "fade",
  })

  vim.notify = notify
end

function config_dressing()
  local dressing = require("dressing")

  dressing.setup({
    input = {
      default_prompt = "➤ ",
      winhighlight = "Normal:Normal,NormalNC:Normal",
    },
    select = {
      backend = { "telescope", "builtin" },
      builtin = { winhighlight = "Normal:Normal,NormalNC:Normal" },
    },
  })
end
