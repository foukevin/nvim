local M = {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
}

function M.config()
	require("lualine").setup({
		-- options = {
		--     theme = "Dracula",
		-- },
		sections = {
			lualine_c = {
				{
					"filename",
					path = 1, -- Affiche le chemin complet
				},
			},
		},
	})
end

return M
