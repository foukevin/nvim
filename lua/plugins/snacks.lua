local M = {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
}

function M.config()
	require("snacks").setup({})
end

return M
