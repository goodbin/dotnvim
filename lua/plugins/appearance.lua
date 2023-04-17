function install(use, theme)
  use({"nvim-tree/nvim-web-devicons", config = "devicons_config"})

  if theme == "darkplus" then
    use({"LunarVim/darkplus.nvim", config = "darkplus_config"})
  end

  if theme == "gruvbox" then
    use({"sainnhe/gruvbox-material", config = "gruvbox_config"})
  end
end

function devicons_config()
  local devicons = require("nvim-web-devicons")

  devicons.set_icon({
    deb = { icon = "", name = "Deb" },
    lock = { icon = "", name = "Lock" },
    mp3 = { icon = "", name = "Mp3" },
    mp4 = { icon = "", name = "Mp4" },
    out = { icon = "", name = "Out" },
    ["robots.txt"] = { icon = "ﮧ", name = "Robots" },
    socket = { icon = "ﳥ", name = "Socket" },
    ttf = { icon = "", name = "TrueTypeFont" },
    rpm = { icon = "", name = "Rpm" },
    woff = { icon = "", name = "WebOpenFontFormat" },
    woff2 = { icon = "", name = "WebOpenFontFormat2" },
    xz = { icon = "", name = "Xz" },
    zip = { icon = "", name = "Zip" },
  })
end

function gruvbox_config()
  vim.g.background = "dark"
  vim.g.gruvbox_material_background = "hard"
  vim.g.gruvbox_material_foreground = "mix"
  vim.g.gruvbox_material_better_performance = true
  vim.g.gruvbox_material_enable_bold = false
  vim.g.gruvbox_material_dim_inactive_windows = false
  vim.cmd.colorscheme("gruvbox-material")
end

function darkplus_config()
  vim.g.italic_keywords = true
  vim.g.background = "dark"
  vim.cmd.colorscheme("darkplus")

  local c = require("darkplus.palette")
  local hl = vim.api.nvim_set_hl

  hl(0, "@comment", { link = "Comment" })
  hl(0, "@parameter", { link = "Identifier" })
  hl(0, "@variable", { link = "Identifier" })
  hl(0, "@field", { link = "Identifier" })
  hl(0, "@namespace", { link = "Define" })
  hl(0, "@include", { link = "Keyword" })
  hl(0, "@punctuation.special", { link = "Include" })
end

