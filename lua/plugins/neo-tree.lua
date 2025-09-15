return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        vim.keymap.set(
            "n",
            "<C-n>",
            ":Neotree filesystem reveal left<CR>",
            { desc = "Open neo-tree at current file or working directory" }
        )
    end,
}
