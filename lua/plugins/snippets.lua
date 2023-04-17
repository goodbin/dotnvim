function install(use)
  use({ "L3MON4D3/LuaSnip", config = "luasnip_config" })
end

function luasnip_config()
  local luasnip = require("luasnip")
  local types = require("luasnip.util.types")
  local snip_dir = vim.fn.stdpath("config") .. "/luasnip"

  require("luasnip.loaders.from_vscode").lazy_load({
    paths = snip_dir,
  })

  require("luasnip.loaders.from_lua").load()

  luasnip.config.setup({
    ext_opts = {
      [types.choiceNode] = {
        active = {
          virt_text = { { "●", "Comment" } },
        },
      },
      [types.insertNode] = {
        active = {
          virt_text = { { "●", "Comment" } },
        },
      },
    },
  })

  vim.api.nvim_create_autocmd("InsertLeave", {
    callback = function()
      if
        luasnip.session.current_nodes[vim.api.nvim_get_current_buf()]
        and not luasnip.session.jump_active
      then
        luasnip.unlink_current()
      end
    end,
  })
end
