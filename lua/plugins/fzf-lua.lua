local keymap = function()
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

local config = function()
	local fzf = require("fzf-lua")
	fzf.register_ui_select()
end

local M = {
	{
		"ibhagwan/fzf-lua",

		--optional icon support
		dependencies = { "nvim-tree/nvim-web-devicons" },
		---@module 'fzf-lua'
		---@type fzf-lua.Config|{}
		---@diagnostic disable: missing-fields
		opts = keymap,
		---@diagnostic enable: missing-fields
		---
		config = config,
	},
}

return M
