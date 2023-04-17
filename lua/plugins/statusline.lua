-- settings/statusline

function install(use)
  use({ "nvim-lualine/lualine.nvim", config = "lualine_config" })
end

function lualine_config()
  local lualine = require("lualine")

  local hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end

  local diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    sections = { "error", "warn" },
    symbols = { error = " ", warn = " " },
    colored = false,
    update_in_insert = false,
    always_visible = true,
  }

  local diff = {
    "diff",
    colored = false,
    symbols = {
      added = " ",
      modified = " ",
      removed = " ",
    },
    cond = hide_in_width,
  }

  local branch = {
    "branch",
    icons_enabled = true,
    icon = "",
  }

  local lsp_server = {
    function()
      local msg = "No Active Lsp"
      local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
      local clients = vim.lsp.get_active_clients()
      if next(clients) == nil then
        return msg
      end
      for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
          return client.name
        end
      end
      return msg
    end,
    icon = " ",
  }

  lualine.setup({
    options = {
      globalstatus = true,
      icons_enabled = true,
      theme = "auto",
      component_separators = { left = "|", right = "|" },
      section_separators = { left = "", right = "" },
      ignore_focus = { "alpha", "dashboard", "NvimTree", "Outline", "neo-tree" },
      always_divide_middle = true,
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { branch, lsp_server, diagnostics },
      lualine_c = { { "filename", file_status = true, path = 1 } },
      lualine_x = { "encoding", "fileformat", "filetype" },
      lualine_y = { "location" },
      lualine_z = {},
    },
  })
end
