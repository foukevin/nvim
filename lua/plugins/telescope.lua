local config = function()
        require("telescope").setup({
            defaults = {
                theme = "center",
                sorting_strategy = "ascending",
                layout_config = {
                    horizontal = {
                        prompt_position = "top",
                        preview_width = 0.5
                    },
                },
            },
        })
end

local keymap = function()
    local wk = require("which-key")
    local builtin = require("telescope.builtin")
    wk.add({
        mode = "n",
        { "<Leader>f", group = "Telescope" },
        { "<Leader>ff", builtin.find_files, desc = "Find files" },
        { "<leader>fg", builtin.live_grep, desc = "Live grep" },
        { "<leader>fb", builtin.buffers, desc = "Buffers" },
        { "<leader>fh", builtin.help_tags, desc = "Help tags" },
    })
end

return {
    "nvim-telescope/telescope.nvim",
    -- tag = '0.1.8',
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        --{ "nvim-telescope/telescope-fzf-native.nvim", build = "make"}
    },
    config = config,
    opts = keymap,
}
