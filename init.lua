-- init.lua

local plug = require("utils/vim-plug")

--- Keymapping
plug.register("settings/keymapping")

--- Workspace config
plug.register("settings/workspace")

--- Статусная строка
plug.register("settings/statusline")

--- Файловый менеджер / дерево каталогов
plug.register("settings/tree")

--- Система контроля версий
plug.register("settings/vcs")

-- Снимметы и шаблоны
plug.register("settings/snippets")

--- Completion
plug.register("settings/completion")

-- Editing
plug.register("settings/editing")

--- Languages
plug.register("settings/languages")

--- Внешний вид
plug.register("settings/appearance")

--- Common settings
plug.register("settings/common")

local local_vimrc = vim.fn.getcwd()..'/.nvimrc'
if vim.loop.fs_stat(local_vimrc) then
    vim.cmd('source '..local_vimrc)
end

vim.cmd("filetype plugin indent on");
vim.cmd("syntax on");
plug.setup()

