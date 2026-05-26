local sev = vim.diagnostic.severity

vim.diagnostic.config({
	underline = true,
	severity_sort = true,
	update_in_insert = false, -- less flicker

	float = {
		border = "rounded",
		source = true,
	},

	signs = {
		text = {
			[sev.ERROR] = " ",
			[sev.WARN] = " ",
			[sev.INFO] = "󰠠 ",
			[sev.HINT] = " ",
		},
		-- line number highlight
		numhl = {
			-- [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
			-- [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
			-- [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
			-- [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
		},
	},

	virtual_text = {
		spacing = 4,
		source = "if_many",
		prefix = " ",
	},

	-- virtual_lines = {
	--     -- Only show virtual line diagnostics for the current cursor line
	--     current_line = true,
	-- },
	linehl = {
		[sev.ERROR] = "DiagnosticErrorLine",
	},
})
