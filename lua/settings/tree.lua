-- settings/tree.lua

function plug(manager)
    manager.add("preservim/nerdtree")
    manager.add("tiagofumo/vim-nerdtree-syntax-highlight")
    manager.add("Xuyuanp/nerdtree-git-plugin")
end

function setup()
    -- Netrw settings
    vim.g.netrw_liststyle = 3
    vim.g.netrw_banner = 0
    vim.g.netrw_browse_split = 4
    vim.g.netrw_altv = 1
    vim.g.netrw_winsize = 20

    vim.api.nvim_set_keymap("n", "<C-n>", ":NERDTreeToggle<CR>", { noremap = true })

    vim.g.NERDTreeMouseMode = 0
    vim.g.NERDTreeAutoDeleteBuffer = 1
    vim.g.NERDTreeShowLineNumbers = 0
    vim.g.NERDTreeStatusline = 0
    vim.g.NERDTreeMinimalUI = 1
    vim.g.NERDTreeDirArrowCollapsible = ""
    vim.g.NERDTreeDirArrowExpandable = ""

    -- Автоматически отобразить NertTree если не указан файл
    vim.cmd [[ augroup NERDTreeAutoOpen" ]]
    vim.cmd [[ autocmd! ]]
    vim.cmd [[ autocmd StdinReadPre * let s:std_in=1 ]]
    vim.cmd [[ autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif ]]
    vim.cmd [[ augroup END ]]
end

