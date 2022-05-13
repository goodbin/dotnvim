--- plugins/treesitter.lua

function install(use)
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })
  use("JoosepAlviste/nvim-ts-context-commentstring");
  use("nvim-treesitter/playground");
end

function config()
  local status_ok, tconfig = pcall(require, "nvim-treesitter.configs");
  if not status_ok then
    return;
  end

  vim.cmd([[set foldmethod=expr]]);
  vim.cmd([[set foldexpr=nvim_treesitter#foldexpr()]]);
  vim.cmd([[set indentexpr=nvim_treesitter#indent()]]);

  tconfig.setup({
    ensure_installed = "all",
    sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
    highlight = {
      enable = false,
    },
    indent = {
      enable = true,
    },
    autopairs = {
      enable = true,
    },
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
    playground = {
      enable = true,
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
    }
  });
end
