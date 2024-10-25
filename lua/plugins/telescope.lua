return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    -- or                              , branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim'
    },
    config = function()
        -- set keymaps
        local builtin = require("telescope.builtin")
        local k = vim.keymap.set

        k("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
        k("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
        k("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
        k("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
    end,
}
