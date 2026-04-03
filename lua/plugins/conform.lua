return {
    "stevearc/conform.nvim",
    event = {
        "BufReadPre",
        "BufNewFile",
    },
    config = function()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                css = { "prettier" },
                html = { "prettier" },
                json = { "prettier" },
                yaml = { "prettier" },
                markdown = { "prettier" },
                lua = { "stylua" },
                python = { "isort", "black" },
                c = { "clang_format" },
                cpp = { "clang_format" },
                h = { "clang_format" },
                CMake = { "cmake_format" },
            },
            formatters = {
                stylua = {
                    append_args = { "--indent-width", "2", "--indent-type", "Spaces" },
                },
                clang_format = {
                    prepend_args = { '--style=file', '--fallback-style=LLVM' },
                },
            },
            lsp_fallback = false,
            -- format_on_save = {
            --   lsp_fallback = true,
            --   async = false,
            --   timeout_ms = 500,
            -- },
        })

        vim.keymap.set({ "n", "v" }, "<leader>mf", function()
            conform.format()
        end, { desc = "Format file or range (in visual mode)" })
    end,
}
