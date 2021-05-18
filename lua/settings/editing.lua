--- settings/editing.lua

function plug(manager)
    -- manager.add("svermeulen/vim-cutlass"); -- for off cut to clipboard
    manager.add("scrooloose/nerdcommenter");
end

function setup()
    -- Default matchit off
    vim.g.loaded_matchit = 1;

    -- Add spaces after comment delimiters by default
    vim.g.NERDSpaceDelims = 1;

    -- Use compact syntax for prettified multi-line comments
    vim.g.NERDCompactSexyComs = 0;

    -- Align line-wise comment delimiters flush left instead of following code indentation
    vim.g.NERDDefaultAlign = "left";

    vim.g.NERDCustomDelimiters = {
        d = {
            left = '//',
            leftAlt = '/**',
            rightAlt = '*/'
        },
        prelum = {
            left = '#'
        },
    };

    -- Enable trimming of trailing whitespace when uncommenting
    vim.g.NERDTrimTrailingWhitespace = 1;
end

