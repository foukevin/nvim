local keymap = vim.api.nvim_set_keymap

-- Append semicolumn to line when type ;; in NORMAL mode
-- TODO: should only do this for C/C++ files
keymap("n", ";;", "<S-A>;<ESC>", { noremap = true, silent = false })
