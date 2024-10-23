require("config.lazy")

-- Sets <space> as the leader key
-- vim.g.mapleader = ' '
-- vim.g.maplocallleader = ' '

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = {"*"},
    callback = function()
        local save_cursor = vim.fn.getpos(".")
        pcall(function() vim.cmd [[%s/\s\+$//e]] end)
        vim.fn.setpos(".", save_cursor)
    end,
})


------------------------------------------------------------------------------
-- Basic settings
------------------------------------------------------------------------------
vim.o.scrolloff = 5         -- Minimal number of screen lines to keep above and below the cursor
vim.o.number = true         -- Line numbers
vim.o.colorcolumn = "100"
vim.o.wrap = false          -- Line wrapping
vim.o.termguicolors = true  -- 24-bit RGB colors
vim.o.showmode = false
-- Sets how neovim will display certain whitespace characters in the editor
vim.o.list = true
vim.o.listchars = "tab:▸ ,trail:·,nbsp:␣,extends:⇢,precedes:⇠"
vim.o.showbreak = "…"


------------------------------------------------------------------------------
-- File encoding
------------------------------------------------------------------------------
vim.o.encoding = "utf8"
-- List of character encodings considered when starting to edit an existing file
vim.o.fileencodings = "utf8,big5,iso-2022-jp,euc-jp,cp932,default,latin1"
-- Set the preferrred end-of-line (<EOL>) formats
vim.o.fileformats = "unix,dos,mac"


------------------------------------------------------------------------------
-- Formatting, tabs and indentation
------------------------------------------------------------------------------
vim.o.expandtab = true      -- Convert tabs to spaces
vim.o.tabstop = 4           -- Number of spaces a tab represents
vim.o.shiftwidth = 4        -- Number of spaces for each indentation
vim.o.smartindent = true    -- Automatically indent new lines
vim.o.breakindent = true
-- C indentation
vim.o.cindent = true
-- Place case labels N characters from the indent of the switch()
-- When in unclosed parentheses, indent N characters from the line with the unclosed parentheses
-- Place C++ scope declarations N characters from the indent
vim.o.cinoptions = ":0,(0,g0,t0,l1"


------------------------------------------------------------------------------
-- Search settings
------------------------------------------------------------------------------
-- Case-insensitive search unless \C or one or more capital letters in search term
vim.o.ignorecase = true
vim.o.smartcase = true
-- Briefly jump to the matching bracket when a new one is inserted
vim.o.showmatch = true
-- Tenths of a second to show the matching paren
vim.o.matchtime = 2
vim.o.incsearch = true
vim.o.hlsearch = false


------------------------------------------------------------------------------
-- Syntax highlighting and filetype plugins
------------------------------------------------------------------------------
vim.cmd('syntax enable')
vim.cmd('filetype plugin indent on')

