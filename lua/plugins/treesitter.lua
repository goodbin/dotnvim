--- plugins/treesitter.lua

function install(use)
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })
end

function config()
  local status_ok, tconfig = pcall(require, "nvim-treesitter.configs");
  if not status_ok then
    return;
  end

  tconfig.setup({
    ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
    ignore_install = { "" }, -- List of parsers to ignore installing
    autopairs = {
      enable = true,
    },
    highlight = {
      enable = true, -- false will disable the whole extension
      disable = { "rust" }, -- list of language that will be disabled
      additional_vim_regex_highlighting = true,
    },
    indent = {
      enable = true,
      disable = { "yaml" }
    },
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
  });
end