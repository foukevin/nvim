local options = {
    -- line numbering, column coloring and scrolling
    number          = true,     -- Print the line number in front of each line
    relativenumber  = false,    -- Show the line number relative to the line
                                -- with the cursor in front of each line
    scrolloff       = 8,        -- Minimal number of screen lines to
                                -- keep above and below the cursor
    showmode        = false,    -- If in Insert, Replace or Visual mode
                                -- put a message on the last line
    colorcolumn     = "100",    -- 'colorcolumn' is a comma-separated list
    signcolumn      = "yes",    -- When and how to draw the signcolumn
    wrap            = false,    -- When on, lines longer than the width of the window will wrap


    -- tabs and indentation
    breakindent     = true,     -- Every wrapped line will continue visually indented
                                -- (same amount of space as the beginning of that line)
    tabstop         = 4,        -- Number of spaces that a <Tab> in the file counts for
                                -- number of spaces to insert a <Tab>
    shiftwidth      = 4,        -- Number of spaces to use for each step of (auto)indent
    expandtab       = true,     -- In Insert mode: Use the appropriate
    -- smartindent     = true,     -- Do smart autoindenting when starting a new line
    cindent         = true,     -- Enables automatic C program indenting
    cinoptions      = ":0,(0,g0,t0,l1,N-s,E-s", -- The 'cinoptions' affect the way 'cindent'
                                                -- reindents lines in a C program
    backspace       = "indent,eol,start",       -- Influences the working of <BS>, <Del>,
                                                -- CTRL-W and CTRL-U in Insert mode


    -- bracket matching
    showmatch       = true,     -- When a bracket is inserted, briefly jump to the matching one
    matchtime       = 2,        -- Tenths of a second to show the matching paren


    -- search settings
    ignorecase      = true,     -- Ignore case in search patterns
    smartcase       = true,     -- Override the 'ignorecase' option if the search
                                -- pattern contains upper case characters
    hlsearch        = false,    -- When there is a previous search pattern,
                                -- highlight all its matches
    incsearch       = true,     -- While typing a search command, show where the pattern,
                                -- as it was typed so far, matches

    -- colors
    termguicolors   = true,     -- Enables 24-bit RGB color in the Terminal UI
                                -- of screen columns that are highlighted
    background      = "dark",   -- When set to "dark" or "light", adjusts the
                                -- default color groups for that background type


    -- A comma-separated list of options for Insert mode completion
    completeopt     = "menu,menuone,noselect",

    -- This is a list of character encodings considered when starting to edit an existing file
    fileencodings   = "utf8,big5,iso-2022-jp,euc-jp,cp932,default,latin1",

    -- This gives the end-of-line (<EOL>) formats that will be tried when starting
    -- to edit a new buffer and when reading a file into an existing buffer
    fileformats     = "unix,dos,mac",


    -- Text display
    encoding        = "utf8",   -- String-encoding used internally and for RPC communication
    emoji           = false,    -- When on all Unicode emoji characters
                                -- are considered to be full width
    list            = true,     -- Useful to see the difference between tabs
                                -- and spaces and for trailing blanks
    showbreak       = "…",      -- String to put at the start of lines that have been wrapped
    -- Strings to use in 'list' mode and for the :list command
    listchars       = "tab:▸ ,trail:·,nbsp:␣,extends:⇢,precedes:⇠",


    -- Swap and session
    swapfile        = false,
    -- Changes the effect of the :mksession command.
    sessionoptions  = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
}

for k, v in pairs(options) do
    vim.o[k] = v
end


-- Add filetypes
vim.filetype.add({
    extension = {
        hlsl = "hlsl",
    },
})


-- Sets <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocallleader = ' '


-- Use italic font for comments
local function update_hl( group, tbl )
    local old_hl = vim.api.nvim_get_hl_by_name( group, true )
    local new_hl = vim.tbl_extend( 'force', old_hl, tbl )
    vim.api.nvim_set_hl( 0, group, new_hl )
end

update_hl( 'Comment', { italic = true } )
