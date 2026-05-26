local options = {

	-- Line numbering, column coloring and scrolling
	number = true, -- Print the line number in front of each line
	relativenumber = false, -- Relative line numbers
	scrolloff = 8, -- Minimal number of screen lines to keep above and below the cursor
	sidescrolloff = 8, -- Minimal number of screen columns to keep on the side of the cursor
	colorcolumn = "100", -- 'colorcolumn' is a comma-separated list
	wrap = false, -- When on, lines longer than the width of the window will wrap

	-- Tabs and indentation
	tabstop = 4, -- Tab width
	softtabstop = 4,
	shiftwidth = 4, -- Indent width
	expandtab = true, -- Use space instead of tabs
	smartindent = true, -- Do smart autoindenting when starting a new line

	-- C/C++ indentation
	cindent = true, -- Enables automatic C program indenting
	cinoptions = ":0,(0,g0,t0,l1,N-s,E-s", -- The 'cinoptions' affect the way 'cindent' reindents lines in a C program

	-- Behavior
	backspace = "indent,eol,start", -- Influences the working of <BS>, <Del>, CTRL-W and CTRL-U in Insert mode
	breakindent = true, -- Every wrapped line will continue visually indented (same amount of space as the beginning of that line)

	-- autocompletion
	autocomplete = true, -- 'nvim-cmp' optional now
	autocompletedelay = 200, -- Delay in ms before the autocomplete menu appears

	-- Search settings
	ignorecase = true, -- Ignore case in search patterns
	smartcase = true, -- Case sensitive if uppercase in search pattern
	hlsearch = false, -- When there is a previous search pattern, highlight all its matches
	incsearch = true, -- Show matches as you type

	-- Visual settings
	termguicolors = true, -- Enables 24-bit RGB color in the Terminal UI
	signcolumn = "yes", -- Always draw the signcolumn bracket matching
	showmatch = true, -- When a bracket is inserted, briefly jump to the matching one
	matchtime = 2, -- Tenths of a second to show the matching paren/bracket
	background = "dark", -- When set to "dark" or "light", adjusts the default color groups for that background type
	winborder = "rounded", -- Border type on floating windows
	cmdheight = 1, -- Command line height
	showmode = false, -- Don't show mode in command line
	completeopt = "menu,menuone,noselect",
	ruler = false, -- Disable the default ruler
	virtualedit = "block", -- Allow cursor to move where there is no text in visual mode

	-- This is a list of character encodings considered when starting to edit an existing file
	fileencodings = "utf8,big5,iso-2022-jp,euc-jp,cp932,default,latin1",

	-- This gives the end-of-line (<EOL>) formats that will be tried when starting
	-- to edit a new buffer and when reading a file into an existing buffer
	fileformats = "unix,dos,mac",

	-- Text display
	encoding = "utf8", -- String-encoding used internally and for RPC communication
	emoji = false, -- When on all Unicode emoji characters are considered to be full width
	list = true, -- Useful to see the difference between tabs and spaces and for trailing blanks
	showbreak = "…", -- String to put at the start of lines that have been wrapped
	-- Strings to use in 'list' mode and for the :list command
	listchars = "tab:▸ ,trail:·,nbsp:␣,extends:⇢,precedes:⇠",

	-- Split behavior
	splitbelow = true, -- Horizontal splits go below
	splitright = true, -- Vertical splits go right
	splitkeep = "screen",

	-- File handling
	backup = false, -- Don't create backup files
	writebackup = false, -- Don't create backup files before writing
	swapfile = false, -- Don't create swap files
	undofile = true, -- Persistent undo
	undolevels = 1000,
	undodir = vim.fn.expand("~/.vim/undodir"), -- Undo directory

	updatetime = 300, -- Faster completion
	timeout = true,
	timeoutlen = 300, -- Lower timeout for faster whick-key response
	autoread = true, -- Auto reload files changed outside vim

	-- Changes the effect of the :mksession command.
	sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions",

	-- Performance improvements
	redrawtime = 10000,
	maxmempattern = 20000,
}

for k, v in pairs(options) do
	vim.o[k] = v
end

-- Create undo directory if it doesn't exist
if vim.fn.isdirectory(options["undodir"]) == 0 then
	vim.fn.mkdir(options["undodir"], "p")
end

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
