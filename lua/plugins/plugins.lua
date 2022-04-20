-- plugins/plugins.lua

function install(use)
  use("nvim-lua/plenary.nvim");              -- Useful lua functions used ny lots of plugins
  use("nvim-lua/popup.nvim");                -- An implementation of the Popup API from vim in Neovim
  use("antoinemadec/FixCursorHold.nvim");    -- This is needed to fix lsp doc highlight
  use("kyazdani42/nvim-web-devicons");
  use("lambdalisue/suda.vim");
end
