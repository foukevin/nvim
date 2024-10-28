return {
    "nvim-tree/nvim-tree.lua",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        local nvimtree = require("nvim-tree")

        -- recommended settings from nvim-tree documentation
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        nvimtree.setup({
            view = {
                width = 35,
                relativenumber = true,
            },
        })

        -- set keymaps
        local k = vim.keymap.set
        k("n", "<Leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
    end
}
