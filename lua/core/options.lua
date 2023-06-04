local opt = vim.opt

-- Commons
opt.laststatus = 3              -- Global status
opt.showmode = false            -- Disable showing modes in command line
opt.clipboard = "unnamedplus"   -- Connection to the system clipboard
opt.cursorline = true           -- Highlight the text line of the cursor
opt.termguicolors = true        -- Enable 24-bit RGB color in the TUI
opt.shortmess:append "sI"
opt.splitbelow = true           -- Splitting a new window below the current one
opt.splitright = true           -- Splitting a new window at the right of the current one
opt.cmdheight = 0               -- Hide command line unless needed
opt.completeopt = { "menuone", "noselect" } -- Options for insert mode completion

-- Identing
local indent = 4
opt.expandtab = true            -- Enable the use of space in tab
opt.shiftwidth = indent         -- Number of space inserted for indentation
opt.smartindent = true          -- Make indenting smarter again
opt.tabstop = indent            -- Number of space in a tab
opt.softtabstop = indent

-- Numbers
opt.number = true               -- Show numberline
opt.numberwidth = 4             -- Set number column width
opt.ruler = false
opt.signcolumn = "yes"          -- Always show the sign column

-- Scroll
opt.scrolloff = 3               -- Number of lines to keep above and below the cursor
opt.sidescrolloff = 5           -- Number of columns to keep at the sides of the cursor

-- Timings
opt.updatetime = 250            -- Length of time to wait before triggering the plugin
opt.timeoutlen = 500            -- Length of time to wait for a mapped sequence

-- Editing
opt.fillchars = { eob = " " }   -- Disable `~` on nonexistent lines
opt.ignorecase = true           -- Case insensitive searching
opt.smartcase = true            -- Case sensitivie searching
opt.undofile = true             -- Enable persistent undo
opt.swapfile = false            -- Disable use of swapfile for the buffer

-- Folding
opt.foldlevel = 99              -- Folding level

-- Search
opt.hlsearch = true             -- highlight all matches on previous search pattern
opt.incsearch = true            -- incremntal search


-- opt.encoding = "utf-8";                      -- the encoding setting
-- opt.winbar = "%f";
-- opt.backup = false;                          -- creates a backup file
-- opt.writebackup = false;                     -- if a file is being edited by another program
-- opt.conceallevel = 0,                        -- so that `` is visible in markdown files
-- opt.showcmd = false,                         -- show commands in status bar
-- opt.list = true,
-- opt.listchars = [[tab:>\ ,nbsp:_,trail:~,extends:>,precedes:<,nbsp:+,eol:↴]],
-- opt.tabpagemax = 50,
-- opt.errorbells = false,                      -- no beeps
-- opt.colorcolumn = "100";                     -- Show 100 columns width limit
--
-- opt.backspace = vim.opt.backspace:append("nostop"), -- Dot't stop backspace at insert
-- opt.copyindent = true, -- Copy the previous indentation on autoindenting
-- opt.fileencoding = "utf-8", -- File content encoding for the buffer
-- opt.history = 100, -- Number of commands to remember in a history table
-- opt.lazyredraw = true, -- Lazily redraw screen
-- opt.preserveindent = true, -- Preserve indent structure as much as possible
-- opt.pumheight = 10, -- Height of the pop up menu
-- opt.relativenumber = false, -- Show relative numberline
-- opt.showtabline = 2, -- Always display tabline
-- opt.wrap = false, -- Disable wrapping of lines longer than the width of window
-- opt.writebackup = false, -- Disable making a backup before overwriting a file
-- opt.formatoptions = "cqj",

-- Global variables
vim.g.editorconfig = true       -- Enable editorconfig

-- Configure inner plugins
local loaded = {
--  2html_plugin = true,        -- Disable 2html
--  getscript = true,           -- Disable getscript
--  getscriptPlugin = true,     -- Disable getscript
--  gzip = true,                -- Disable gzip
--  logipat = true,             -- Disable logipat
--  matchit = true,             -- Disable matchit
  netrwFileHandlers = true,     -- Disable netrw
  netrw = true,                 -- Disable netrw
  netrwPlugin = true,           -- Disable netrw
--  netrwSettngs = true,        -- Disable netrw
--  remote_plugins = true,      -- Disable remote plugins
--  tar = true,                 -- Disable tar
--  tarPlugin = true,           -- Disable tar
--  zip = true,                 -- Disable zip
--  zipPlugin = true,           -- Disable zip
--  vimball = true,             -- Disable vimball
--  vimballPlugin = true,       -- Disable vimball
--  load_black = false,         -- Disable black
  python_provider = 0,          -- Disable python provider
  python3_provider = 0,         -- Disable python3 provider
  ruby_provider = 0,            -- Disable ruby provider
  node_provider = 0,            -- Disable nodejs provider
  perl_provider = 0,            -- Disable perl provider
  man = true,                   -- Disable man
}

for k, v in pairs(loaded) do
  local name = "loaded_" .. k
  vim.g[name] = v
end
