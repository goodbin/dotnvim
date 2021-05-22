-- settings/common.lua

local indent = 4;

function setup()
    -- Key code sequence and timeout
    vim.o.ttimeout = true;
    vim.o.ttimeoutlen = 50;
    vim.o.timeoutlen = 1000;

    -- Allow NeoVim to set terminal title
    vim.o.title = true;

    -- show signcolumn
    vim.wo.signcolumn = "yes"

    -- Show both line numbers
    vim.wo.number = true;

    -- Set tab width to 4
    vim.bo.tabstop = indent;
    vim.o.tabstop = indent;
    vim.bo.shiftwidth = indent;
    vim.o.shiftwidth = indent;
    vim.bo.softtabstop = indent;
    vim.o.softtabstop = indent;
    -- Replace tab to spaces
    vim.bo.expandtab = true;
    vim.o.expandtab = true;

    -- Backups off
    vim.o.backup = false;
    vim.o.undofile = false;
    vim.o.swapfile = false;

    -- Enable system clipboard integration
    -- Need installed xsel
    if vim.fn.has("clipboard") ~= 0 then
        vim.o.clipboard = "unnamedplus";
    end

    -- Кодировка текста по умолчанию utf8
    vim.g.termencoding = "utf8";
    vim.o.encoding = "utf-8";

    -- Show 100 columns width limit
    vim.wo.colorcolumn = "100";

    -- Allow backspace everywhere
    vim.o.backspace = "indent,eol,start";

    -- Keep more content at the bottom of the buffer
    vim.o.scrolloff = 3;
    vim.o.sidescrolloff = 5;

    -- wrap заставляет переносить строчки без их разделения
    -- Соответсвенно nowrap рендерит строчки за границами экрана
    vim.wo.wrap = true;
    vim.wo.linebreak = true;
    vim.wo.list = true;

    -- Searching and highlines
    vim.o.hlsearch = true;
    -- Поиск в процессе набора
    vim.o.incsearch = true;
    vim.o.smartcase = true;

    -- Дополнительная информация в строке состояния
    vim.o.wildmenu = true;
    -- command bar height
    vim.o.cmdheight = 1;
    -- No beeps
    vim.o.errorbells = false;

    -- Увеличение размера истории
    if vim.o.history < 1000 then
        vim.o.history = 1000;
    end
    if vim.o.tabpagemax < 50 then
        vim.o.tabpagemax = 50;
    end
    if not vim.o.viminfo then
        vim.o.viminfo = "!";
    end

    -- Настройка отображения специальных символов
    vim.o.listchars = [[tab:>\ ,nbsp:_,trail:~,extends:>,precedes:<,nbsp:+]];
end

-- set display+=lastline

-- set cindent
-- " set autoindent
-- " Включаем 'умные' отступы, например, авто отступ после `{`
-- set smartindent

-- " Показывать положение курсора всё время.
-- set ruler
-- " Показывать незавершённые команды в статусбаре
-- set showcmd
-- " Отключаем панели прокрутки в GUI
-- set guioptions=
-- " Отключаем панель табов (окошки FTW)
-- set showtabline=0

-- "=============НАСТРОЙКИ СВОРАЧИВАНИЯ БЛОКОВ КОДА (фолдинг)=============
-- set foldenable  " включить фолдинг по умолчанию
-- set foldmethod=syntax  " определять блоки на основе синтаксиса файла
-- set foldlevel=100  " Развернуть все по умолчанию

-- set sessionoptions-=options

