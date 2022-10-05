-- settings/common.lua

function install(use)
  use("nvim-lua/plenary.nvim");                 -- Useful lua functions used ny lots of plugins
  use("kyazdani42/nvim-web-devicons");
end

function config()
  local opt = vim.opt;
  local indent = 4;

  opt.fileencoding = "utf-8";                  -- the encoding written to a file
  opt.encoding = "utf-8";                      -- the encoding setting

  opt.number = true;                           -- show line numbers
  opt.relativenumber = false;                  -- set relative numbered lines
  opt.numberwidth = 4;                         -- set number column width to 4
  opt.cmdheight = 1;                           -- more space in the neovim command line for displaying messages

  opt.backup = false;                          -- creates a backup file
  opt.undofile = true;                         -- disable persistent undo
  opt.swapfile = false;                        -- creates a swapfile
  opt.writebackup = false;                     -- if a file is being edited by another program
  opt.history = 100;

  opt.hlsearch = true;                         -- highlight all matches on previous search pattern
  opt.ignorecase = true;                       -- ignore case in search patterns
  opt.incsearch = true;                        -- incremntal search

  opt.smartcase = true;                        -- smart case
  opt.smartindent = true;                      -- make indenting smarter again
  opt.laststatus = 3;
  opt.ch = 0;
  opt.winbar = "%f";

-- opt.pumheight = 10,                          -- pop up menu height
-- opt.updatetime = 300,                        -- faster completion (4000ms default)
-- opt.timeoutlen = 1000,                       -- time to wait for a mapped sequence to complete (in milliseconds)
-- opt.fillchars.eob = " ";
-- opt.conceallevel = 0,                        -- so that `` is visible in markdown files
-- opt.showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
-- opt.showtabline = 0,                         -- always show tabs
-- opt.showcmd = false,                         -- show commands in status bar
-- opt.ruler = false,                           -- show ruler
-- opt.signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
-- opt.splitbelow = true,                       -- force all horizontal splits to go below current window
-- opt.splitright = true,                       -- force all vertical splits to go to the right of current window
-- opt.backspace = "indent,eol,start",          -- Allow backspace everywhere
-- opt.list = true,
-- opt.listchars = [[tab:>\ ,nbsp:_,trail:~,extends:>,precedes:<,nbsp:+,eol:↴]],
-- opt.tabpagemax = 50,
-- opt.wrap = false,                            -- display lines as one long line
-- opt.errorbells = false,                      -- no beeps

  opt.scrolloff = 3;                           -- keep more content at the bottom of the buffer
  opt.sidescrolloff = 5;

  opt.expandtab = true;                        -- convert tabs to spaces
  opt.shiftwidth = indent;                     -- the number of spaces inserted for each indentation
  opt.softtabstop = indent;
  opt.tabstop = indent;                        -- insert spaces for a tab

  opt.cursorline = true;                       -- highlight the current line
  opt.colorcolumn = "100";                     -- Show 100 columns width limit
  opt.foldlevel = 99;

  -- Disable providers
  vim.g.loaded_python_provider = 0;
  vim.g.loaded_python3_provider = 0;
  vim.g.loaded_ruby_provider = 0;
  vim.g.loaded_node_provider = 0;
  vim.g.loaded_perl_provider = 0;
  vim.g.loaded = 1;

  local disabled_built_ins = {
    "remote_plugins",
    "tutor_mode_plugin",
    "netrwPlugin",
    "man",
  };

  for _, name in pairs(disabled_built_ins) do
    vim.g["loaded_" .. name] = 1;
  end

  -- Enable system clipboard integration
  if vim.fn.has("clipboard") ~= 0 then
    vim.opt.clipboard = "unnamedplus";
  end
end
