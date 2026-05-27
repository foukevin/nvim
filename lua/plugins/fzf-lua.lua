vim.pack.add({
	"https://github.com/ibhagwan/fzf-lua",
	--optional icon support
	"https://github.com/nvim-tree/nvim-web-devicons",
})

local fzf = require("fzf-lua")
fzf.register_ui_select()

local wk = require("which-key")
wk.add({
	mode = "n",
	{ "<Leader>f", group = "Fuzzy finder" },
	{ "<Leader>ff", fzf.files, desc = "Files" },
	{ "<leader>fg", fzf.live_grep, desc = "Live grep" },
	{ "<leader>fb", fzf.buffers, desc = "Buffers" },
	{ "<leader>fh", fzf.helptags, desc = "Help tags" },
	{ "<leader>fs", fzf.lsp_document_symbols, desc = "Symbols" },
})
