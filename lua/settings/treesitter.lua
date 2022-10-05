-- settings/treesitter

function install(use)
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function() require("nvim-treesitter.install").update { with_sync = true } end,
  });
  use("JoosepAlviste/nvim-ts-context-commentstring");
end

function config()
  local status_ok, tconfig = pcall(require, "nvim-treesitter.configs");
  if not status_ok then
    return;
  end

  vim.opt["foldmethod"] = "expr";
  vim.opt["foldexpr"] = "nvim_treesitter#foldexpr()";

  tconfig.setup({
    ensure_installed = "all",
    sync_install = false,
    highlight = {
      enable = false,
    },
    indent = {
      enable = true,
      disable = { "dart", "d" },
    },
    autopairs = {
      enable = true,
    },
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
  });
end
