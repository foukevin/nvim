local opt = vim.opt

-- Line numbering, column coloring and scrolling
opt.number = true -- Print the line number in front of each line
opt.relativenumber = false -- Relative line numbers
opt.scrolloff = 8 -- Minimal number of screen lines to keep above and below the cursor
opt.sidescrolloff = 8 -- Minimal number of screen columns to keep on the side of the cursor
opt.colorcolumn = "100" -- 'colorcolumn' is a comma-separated list
opt.wrap = false -- When on, lines longer than the width of the window will wrap

-- Tabs and indentation
opt.tabstop = 4 -- Tab width
opt.softtabstop = 4
opt.shiftwidth = 4 -- Indent width
opt.shiftround = true
opt.expandtab = true -- Use space instead of tabs
opt.smartindent = true -- Do smart autoindenting when starting a new line

-- C/C++ indentation
opt.cindent = true -- Enables automatic C program indenting
opt.cinoptions = ":0,(0,g0,t0,l1,N-s,E-s" -- The 'cinoptions' affect the way 'cindent' reindents lines in a C program

-- Behavior
opt.backspace = "indent,eol,start" -- Influences the working of <BS>, <Del>, CTRL-W and CTRL-U in Insert mode
opt.breakindent = true -- Every wrapped line will continue visually indented (same amount of space as the beginning of that line)

-- autocompletion
opt.autocomplete = true -- 'nvim-cmp' optional now
opt.autocompletedelay = 200 -- Delay in ms before the autocomplete menu appears

-- Search settings
opt.ignorecase = true -- Ignore case in search patterns
opt.smartcase = true -- Case sensitive if uppercase in search pattern
opt.hlsearch = false -- When there is a previous search pattern, highlight all its matches
opt.incsearch = true -- Show matches as you type

-- Visual settings
opt.termguicolors = true -- Enables 24-bit RGB color in the Terminal UI
opt.signcolumn = "yes" -- Always draw the signcolumn bracket matching
opt.showmatch = true -- When a bracket is inserted, briefly jump to the matching one
opt.matchtime = 2 -- Tenths of a second to show the matching paren/bracket
opt.background = "dark" -- When set to "dark" or "light", adjusts the default color groups for that background type
opt.cmdheight = 1 -- Command line height
opt.showmode = false -- Don't show mode in command line
opt.completeopt = "menu,menuone,noselect"
opt.ruler = false -- Disable the default ruler
opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual mode

-- This is a list of character encodings considered when starting to edit an existing file
opt.fileencodings = "utf8,big5,iso-2022-jp,euc-jp,cp932,default,latin1"

-- This gives the end-of-line (<EOL>) formats that will be tried when starting
-- to edit a new buffer and when reading a file into an existing buffer
opt.fileformats = "unix,dos,mac"

-- Text display
opt.encoding = "utf8" -- String-encoding used internally and for RPC communication
opt.emoji = false -- When on all Unicode emoji characters are considered to be full width
opt.list = true -- Useful to see the difference between tabs and spaces and for trailing blanks
opt.showbreak = "…" -- String to put at the start of lines that have been wrapped
-- Strings to use in 'list' mode and for the :list command
opt.listchars = "tab:▸ ,trail:·,nbsp:␣,extends:⇢,precedes:⇠"

-- Folding settings
opt.smoothscroll = true
vim.wo.foldmethod = "expr"
opt.foldlevel = 99 -- Start with all folds open

-- Split behavior
opt.splitbelow = true -- Horizontal splits go below
opt.splitright = true -- Vertical splits go right
opt.splitkeep = "screen"

-- File handling
opt.backup = false -- Don't create backup files
opt.writebackup = false -- Don't create backup files before writing
opt.swapfile = false -- Don't create swap files
opt.undofile = true -- Persistent undo
opt.undolevels = 1000
opt.undodir = vim.fn.expand("~/.vim/undodir") -- Undo directory

opt.updatetime = 300 -- Faster completion
opt.timeout = true
opt.timeoutlen = 300 -- Lower timeout for faster whick-key response
opt.autoread = true -- Auto reload files changed outside vim

-- Changes the effect of the :mksession command.
opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- Performance improvements
opt.redrawtime = 10000
opt.maxmempattern = 20000

-- Create undo directory if it doesn't exist
local undodir = vim.fn.expand("~/.vim/undodir")
if vim.fn.isdirectory(undodir) == 0 then
	vim.fn.mkdir(undodir, "p")
end

opt.winborder = "rounded" -- Border type on floating windows
opt.pumborder = "rounded" -- Border type on popup menus
opt.fillchars = {
	foldopen = "",
	foldclose = "",
	fold = " ",
	foldsep = " ",
	diff = "╱",
	eob = " ",
}

-- Use italic font for comments
local update_hl = function(group, tbl)
	local old_hl = vim.api.nvim_get_hl_by_name(group, true)
	local new_hl = vim.tbl_extend("force", old_hl, tbl)
	vim.api.nvim_set_hl(0, group, new_hl)
end

-- update_hl( 'Comment', { italic = true } )

-- Add filetypes
vim.filetype.add({
	extension = {
		hlsl = "hlsl",
	},
})
