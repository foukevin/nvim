return {
    "folke/which-key.nvim",
    event = "VeryLazy",

    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 500
    end,

    config = function()
        local whichkey = require("which-key")

        local conf = {
            win = {
                border = "double",   -- none, single, double, shadow
                position = "bottom", -- bottom, top
            },
            -- preset = "helix",
        }

        whichkey.setup({ preset = "helix" })
    end,

    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    },
}
