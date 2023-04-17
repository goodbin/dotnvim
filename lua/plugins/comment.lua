function install(use)
  use({
    "numToStr/Comment.nvim",
    config = "comment_config",
    dependencies = {
      {"JoosepAlviste/nvim-ts-context-commentstring"},
    }
  })
end

function comment_config()
  local pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()
  local comment = require("Comment")

  comment.setup({
    sticky = true,
    padding = true,
    mappings = {
      basic = true,
      extra = false,
    },
    pre_hook = pre_hook,
  })
end
