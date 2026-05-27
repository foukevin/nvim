-- https://www.josean.com/posts/nvim-treesitter-and-textobjects
local M = {
	"nvim-treesitter/nvim-treesitter-textobjects",
	branch = "main",
	lazy = true,
}

function M.config()
	require("nvim-treesitter.configs").setup({
		textobjects = {
			select = {
				enable = true,

				-- automatically jump forward to textobj, similar to targets.vim
				lookahead = true,

				keymaps = {
					["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
					["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },

					["aa"] = { query = "@parameter.outer", desc = "Select outer part of a parameter/argument" },
					["ia"] = { query = "@parameter.inner", desc = "Select inner part of a parameter/argument" },
				},
			},
		},
	})
end

return M
