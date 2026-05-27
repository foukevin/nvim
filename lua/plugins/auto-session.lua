vim.pack.add({
	"https://github.com/rmagatti/auto-session",
})

local as = require("auto-session")
as.setup({
	auto_restore = false,
	suppressed_dirs = { "~/", "~/Downloads", "~/Documents", "~/Desktop/" },
})

local wk = require("which-key")
wk.add({
	{ mode = "n" },
	{ "<Leader>w", group = "Auto-session" },
	-- restore last workspace session for current directory
	{ "<Leader>wr", "<cmd>AutoSession restore<CR>", desc = "Restore session for cwd" },
	-- save workspace session for current working directory
	{ "<Leader>ws", "<cmd>AutoSession save<CR>", desc = "Save session for auto session root dir" },
})
