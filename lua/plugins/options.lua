-- plugins/options.lua

function config()
  local indent = 4;

  local options = {
    number = true,                           -- show line numbers
    relativenumber = false,                  -- set relative numbered lines

    conceallevel = 0,                        -- so that `` is visible in markdown files
    fileencoding = "utf-8",                  -- the encoding written to a file
    encoding = "utf-8",                      -- the encoding setting

    backup = false,                          -- creates a backup file
    undofile = true,                         -- disable persistent undo
    swapfile = false,                        -- creates a swapfile
    writebackup = false,                     -- if a file is being edited by another program

    hlsearch = true,                         -- highlight all matches on previous search pattern
    ignorecase = true,                       -- ignore case in search patterns
    incsearch = true,                        -- incremntal search
    smartcase = true,                        -- smart case

    showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
    showcmd = true,                          -- show commands in status bar
    signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
    splitbelow = true,                       -- force all horizontal splits to go below current window
    splitright = false,                      -- force all vertical splits to go to the right of current window

    scrolloff = 3,                           -- keep more content at the bottom of the buffer
    sidescrolloff = 5,

    pumheight = 10,                          -- pop up menu height
    updatetime = 300,                        -- faster completion (4000ms default)

    expandtab = true,                        -- convert tabs to spaces
    shiftwidth = indent,                     -- the number of spaces inserted for each indentation
    softtabstop = indent,
    tabstop = indent,                        -- insert spaces for a tab

    cursorline = true,                       -- highlight the current line
    wrap = false,                            -- display lines as one long line
    errorbells = false,                      -- no beeps
    colorcolumn = "100",                     -- Show 100 columns width limit

    backspace = "indent,eol,start",          -- Allow backspace everywhere

    list = true,
    listchars = [[tab:>\ ,nbsp:_,trail:~,extends:>,precedes:<,nbsp:+,eol:↴]],

    tabpagemax = 50,
    history = 1000,
  };

  for k, v in pairs(options) do
    vim.opt[k] = v;
  end

  vim.g.loaded_python_provider = 0;
  vim.g.loaded_python3_provider = 0;
  vim.g.loaded_ruby_provider = 0;
  vim.g.loaded_node_provider = 0;
  vim.g.loaded_perl_provider = 0;

  local disabled_built_ins = {
    "gzip",
    "man",
    "matchit",
    "matchparen",
    "shada_plugin",
    "tarPlugin",
    "tar",
    "zipPlugin",
    "zip",
    "netrwPlugin",
  };

  for _, name in pairs(disabled_built_ins) do
    vim.g["loaded_" .. name] = 1;
  end

  -- Enable system clipboard integration
  if vim.fn.has("clipboard") ~= 0 then
    vim.o.clipboard = "unnamedplus";
  end
end
