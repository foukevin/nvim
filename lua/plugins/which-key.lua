M = {
	"folke/which-key.nvim",
	event = "VeryLazy",
}

function M.config()
	require("which-key").setup({ preset = "helix" })
end

return M
