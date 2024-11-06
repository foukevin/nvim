local config = function()
    local nvimtree = require("nvim-tree")

    -- recommended settings from nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    nvimtree.setup({
        view = {
            width = 35,
            relativenumber = false,
        },
    })

    -- set keymaps
    local wk = require("which-key")
    wk.add({
        mode = "n",
        { "<Leader>e", group = "NvimTree" },
        { "<Leader>ee", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file explorer" }
    })
end


return {
    "nvim-tree/nvim-tree.lua",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = config
}
