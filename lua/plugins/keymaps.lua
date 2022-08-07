-- plugins/keymapping.lua

function install(use)
  use("lyokha/vim-xkbswitch");
end

function config()
  -- Shorten function name
  local keymap = vim.keymap.set;

  -- Options
  local opts = { noremap = true, silent = true }
  local term_opts = { silent = true }

  vim.g.XkbSwitchEnabled = 1;
  -- vim.g.XkbSwitchLib = "/home/oleg/Develop/Private/skb-switch/target/debug/libskb_switch.so"

  -- Learn it the hard way
  keymap("", "<up>", "<nop>", {});
  keymap("", "<down>", "<nop>", {});
  keymap("", "<left>", "<nop>", {});
  keymap("", "<rigth>", "<nop>", {});

  -- Off Ex mode
  keymap("", "Q", "<nop>", {});

  -- Better window navigation
  keymap("n", "<C-h>", ":wincmd h<CR>", opts);
  keymap("n", "<C-j>", ":wincmd j<CR>", opts);
  keymap("n", "<C-k>", ":wincmd k<CR>", opts);
  keymap("n", "<C-l>", ":wincmd l<CR>", opts);

  -- Navigate buffers
  keymap("n", "<S-l>", ":bnext<CR>", opts)
  keymap("n", "<S-h>", ":bprevious<CR>", opts)

  -- Close buffers
  keymap("n", "<S-q>", "<cmd>bdelete!<CR>", opts)

  -- turn off search highlight
  keymap("n", "<Leader><space>", ":nohlsearch<CR>", opts)

  keymap("n", "<C-s>", ":w<CR>", opts);
  keymap("i", "<C-s>", "<esc>:w<CR>", opts);
end
