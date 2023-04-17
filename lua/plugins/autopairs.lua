-- settings/autopairs

function install(use)
  use({ "windwp/nvim-autopairs", config = "autopairs_config", event = "InsertEnter" })
end

function autopairs_config()
  local apairs = require("nvim-autopairs")

  apairs.setup({
    check_ts = true,
    check_ts = true,
    ts_config = {
      java = false,
    },
    disable_filetype = { "TelescopePrompt", "spectre_panel", "NvimTree", "neo-tree" },
    fast_wrap = {
      map = "<M-e>",
      chars = { "{", "[", "(", '"', "'" },
      pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
      offset = 0,
      end_key = "$",
      keys = "qwertyuiopzxcvbnmasdfghjkl",
      check_comma = true,
      highlight = "PmenuSel",
      highlight_grey = "LineNr",
    },
  })

  local cmp_autopairs = require("nvim-autopairs.completion.cmp")
  local cmp_status_ok, cmp = pcall(require, "cmp")
  if cmp_status_ok then
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ tex = false }))
  end
end
