--- Vim init lua

local api = vim.api
local plug = require('utils/vim-plug')
functions = require('utils/functions')

--- Цветовая схема
plug.register(
    {'morhetz/gruvbox'},
    {'ryanoasis/vim-devicons'},
    'settings/theme.vim')

-- Статусная строка
plug.register(
    {'vim-airline/vim-airline'},        -- Статусная строка
    {'vim-airline/vim-airline-themes'}, -- Темы для статустой строки
    'settings/airline.vim')

-- .editorconfig file
plug.register(
    {'editorconfig/editorconfig-vim'})

-- Auto-Save
plug.register(
    {'vim-scripts/vim-auto-save'},
    'settings/autosave.vim')

-- Файловый менеджер / дерево каталогов
plug.register(
    {'scrooloose/nerdtree'},
    {'scrooloose/nerdcommenter'},
    'settings/nerdtree.vim')

-- Снимметы и шаблоны
plug.register(
    {'honza/vim-snippets'},    -- Коллекция сниппетов
    {'SirVer/ultisnips'},      -- Сниппеты UltiSnips
    {'aperezdc/vim-template'}, -- Шаблоны
    'settings/snippets.vim')

-- Подсветка измененных строк по версии git
plug.register({'airblade/vim-gitgutter'})

-- Настройка автоподставки
plug.register(
    {'ncm2/ncm2'},
    {'roxma/nvim-yarp'},
    {'ncm2/ncm2-bufword'},
    {'ncm2/ncm2-path'},
    {'ncm2/ncm2-ultisnips'},
    'settings/autocomplete.vim')

-- Настройка LSP клиента
plug.register(
    {'neovim/nvim-lsp'},
    'settings/lsp.lua')

-- Настройка языков
plug.register('settings/languages.vim')

-- Привязка клавиш
plug.register(
    {'lyokha/vim-xkbswitch'},
    'settings/keymapping.vim')

-- Fzf
plug.register(
    {'junegunn/fzf', ['do'] = ':call fzf#install()'},
    {'junegunn/fzf.vim'})

-- Общие настройки
plug.register('settings/common.vim')

plug.setup()
api.nvim_command('filetype plugin indent on')

