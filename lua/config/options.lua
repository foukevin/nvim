local options = {
    breakindent     = true,     -- Every wrapped line will continue visually indented
                                -- (same amount of space as the beginning of that line)
    cindent         = true,     -- Enables automatic C program indenting
    colorcolumn     = "100",    -- 'colorcolumn' is a comma-separated list
                                -- of screen columns that are highlighted
    encoding        = "utf8",   -- String-encoding used internally and for RPC communication
    emoji           = false,    -- When on all Unicode emoji characters
                                -- are considered to be full width
    expandtab       = true,     -- In Insert mode: Use the appropriate
                                -- number of spaces to insert a <Tab>
    hlsearch        = false,    -- When there is a previous search pattern,
                                -- highlight all its matches
    ignorecase      = true,     -- Ignore case in search patterns
    incsearch       = true,     -- While typing a search command, show where the pattern,
                                -- as it was typed so far, matches
    list            = true,     -- Useful to see the difference between tabs
                                -- and spaces and for trailing blanks
    matchtime       = 2,        -- Tenths of a second to show the matching paren
    number          = true,     -- Print the line number in front of each line
    relativenumber  = false,    -- Show the line number relative to the line
                                -- with the cursor in front of each line
    scrolloff       = 8,        -- Minimal number of screen lines to
                                -- keep above and below the cursor
    shiftwidth      = 4,        -- Number of spaces to use for each step of (auto)indent
    showmode        = false,    -- If in Insert, Replace or Visual mode
                                -- put a message on the last line
    smartcase       = true,     -- Override the 'ignorecase' option if the search
                                -- pattern contains upper case characters
    smartindent     = true,     -- Do smart autoindenting when starting a new line
    showbreak       = "…",      -- String to put at the start of lines that have been wrapped
    showmatch       = true,     -- When a bracket is inserted, briefly jump to the matching one
    tabstop         = 4,        -- Number of spaces that a <Tab> in the file counts for
    termguicolors   = true,     -- Enables 24-bit RGB color in the Terminal UI
    wrap            = false,    -- When on, lines longer than the width of the window will wrap

    -- The 'cinoptions' affect the way 'cindent' reindents lines in a C program
    cinoptions      = ":0,(0,g0,t0,l1",

    -- A comma-separated list of options for Insert mode completion
    completeopt     = "menu,menuone,noselect",

    -- This is a list of character encodings considered when starting to edit an existing file
    fileencodings   = "utf8,big5,iso-2022-jp,euc-jp,cp932,default,latin1",

    -- This gives the end-of-line (<EOL>) formats that will be tried when starting
    -- to edit a new buffer and when reading a file into an existing buffer
    fileformats     = "unix,dos,mac",

    -- Strings to use in 'list' mode and for the :list command
    listchars       = "tab:▸ ,trail:·,nbsp:␣,extends:⇢,precedes:⇠"
}

for k, v in pairs(options) do
    vim.o[k] = v
end

-- Sets <space> as the leader key
-- vim.g.mapleader = ' '
-- vim.g.maplocallleader = ' '

