local function augroup(name)
	return vim.api.nvim_create_augroup("user_" .. name, { clear = true })
end

-- Close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
	group = augroup("close_with_q"),
	pattern = {
		"PlenaryTestPopup",
		"checkhealth",
		"dbout",
		"gitsigns-blame",
		"grug-far",
		"help",
		"lspinfo",
		"neotest-output",
		"neotest-output-panel",
		"neotest-summary",
		"notify",
		"qf",
		"spectre_panel",
		"startuptime",
		"tsplayground",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.schedule(function()
			vim.keymap.set("n", "q", function()
				vim.cmd("close")
				pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
			end, {
				buffer = event.buf,
				silent = true,
				desc = "Quit buffer",
			})
		end)
	end,
})

-- Wrap and spell check in text file types
vim.api.nvim_create_autocmd({ "FileType" }, {
	group = augroup("wrap_spell"),
	pattern = { "text", "plaintext", "typst", "gitcommit", "markdown" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

-- Set filetype for .hlsl files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	group = augroup("hlsl_filetype"),
	pattern = { "*.hlsl" },
	callback = function()
		vim.opt_local.filetype = "hlsl"
	end,
})

-- Remove trailing spaces before saving
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = { "*" },
	callback = function()
		local save_cursor = vim.fn.getpos(".")
		pcall(function()
			vim.cmd([[%s/\s\+$//e]])
		end)
		vim.fn.setpos(".", save_cursor)
	end,
})
