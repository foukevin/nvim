local M = {
	"ibhagwan/fzf-lua",
	--optional icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
}

function M.opts()
	local wk = require("which-key")
	local builtin = require("fzf-lua")
	wk.add({
		mode = "n",
		{ "<Leader>f", group = "Fuzzy finder" },
		{ "<Leader>ff", builtin.files, desc = "Files" },
		{ "<leader>fg", builtin.live_grep, desc = "Live grep" },
		{ "<leader>fb", builtin.buffers, desc = "Buffers" },
		{ "<leader>fh", builtin.helptags, desc = "Help tags" },
		{ "<leader>fs", builtin.lsp_document_symbols, desc = "Symbols" },
	})
end

function M.config()
	local fzf = require("fzf-lua")
	fzf.register_ui_select()
end

return M
