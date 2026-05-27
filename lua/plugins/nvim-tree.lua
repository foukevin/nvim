local M = {
	"nvim-tree/nvim-tree.lua",
	dependencies = "nvim-tree/nvim-web-devicons",
}

function M.config()
	local nvimtree = require("nvim-tree")

	-- recommended settings from nvim-tree documentation
	vim.g.loaded_netrw = 1
	vim.g.loaded_netrwPlugin = 1

	nvimtree.setup({
		view = {
			width = 35,
			number = false,
			relativenumber = false,
		},
		git = {
			enable = true,
		},
		renderer = {
			highlight_git = true,
			icons = {
				glyphs = {
					git = {
						-- 󱀻󰻭󱪝󱪝
						unstaged = "󰷉",
						staged = "󰸩",
						unmerged = "",
						renamed = "󱇨",
						untracked = "󱀶",
						deleted = "󱀷",
						ignored = "",
					},
				},
			},
		},
	})

	-- set keymaps
	local wk = require("which-key")
	wk.add({
		mode = "n",
		{ "<Leader>e", group = "NvimTree" },
		{ "<Leader>ee", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file explorer" },
	})
end

return M
