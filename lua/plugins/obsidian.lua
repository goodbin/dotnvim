function install(use)
  use({
    "IlyasYOY/obs.nvim",
    config = "obs_config",
    dependencies = {
      { "IlyasYOY/coredor.nvim" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim" },
    }
  })
end

function obs_config()
  local obs = require("obs")
  obs.setup({
    vault_home = "~/vimwiki",
    journal = {
      template_name = "daily",
    },
  })

  vim.keymap.set("n", "<leader>nT", function()
    obs.vault:run_if_note(function()
      obs.vault:find_and_insert_template()
    end)
  end, { desc = "Inserts notes Template" })

  vim.keymap.set("n", "<leader>nN", function()
    local input = vim.fn.input {
      prompt = "New note name: ",
      default = "",
    }
    local file = obs.vault:create_note(input)
    if file then
      file:edit()
    else
      vim.notify("Note '" .. input .. "' already exists")
    end
  end, { desc = "create new note" })

  vim.keymap.set("n", "<leader>nff", function()
    obs.vault:find_note()
  end, { desc = "notes files find" })
end
