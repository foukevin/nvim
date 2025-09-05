return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")

        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                }
            }
        })

        mason_lspconfig.setup({
            -- list of server for mason to install
            ensure_installed = {
                "lua_ls",
                "clangd",
                "pylsp",
            },
            -- auto-install configured servers (with lspconfig)
            automatic_installation = true,
        })
    end,
}
