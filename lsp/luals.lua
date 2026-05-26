return {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = { ".luarc.json", ".luarc.jsonc" },
	settings = {
		Lua = {
			completion = { callSnippet = "Replace" },
			-- Using stylua for formatting
			format = { enable = false },
			diagnostics = { globals = { "vim" } },
			workspace = {
				checkThirdParty = false,
				-- make language server aware of runtime files
				library = {
					vim.env.VIMRUNTIME,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
}
