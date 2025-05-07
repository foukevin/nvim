local config = function()
    local k = vim.keymap.set

    local opts = { noremap = true, silent = true }
    local on_attach = function(_, bufnr)
        opts.buffer = bufnr

        --[[
        local builtin = require("telescope.builtin")
        local wk = require("which-key")
        wk.add({
            mode = "n",
            { "g", group = "LSP" },
            { "gR", builtin.lsp_references, desc = "Show LSP references" },
            { "gd", builtin.lsp_definitions, desc = "Show LSP definitions" },
            { "gi", builtin.lsp_implementations, desc = "Show LSP implementations" },
            { "gt", builtin.lsp_type_definitions, desc = "Show LSP type definitions" },
        })
        -- ]]

        -- set keybinds
        opts.desc = "Show LSP references"
        k("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

        opts.desc = "Go to declaration"
        k("n", "gD", vim.lsp.buf.declaration, opts)

        opts.desc = "Show LSP definitions"
        k("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

        opts.desc = "Show LSP implementations"
        k("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

        opts.desc = "Show LSP type definitions"
        k("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

        opts.desc = "Show available code actions"
        k({ "n", "v" }, "<Leader>ca", vim.lsp.buf.code_action, opts)

        opts.desc = "Smart rename"
        k("n", "<Leader>rn", vim.lsp.buf.rename, opts)

        opts.desc = "Show buffer diagnostics"
        k("n", "<Leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

        opts.desc = "Show line diagnostics"
        k("n", "<Leader>d", vim.diagnostic.open_float, opts)

        opts.desc = "Go to previous diagnostic"
        k("n", "[d", vim.diagnostic.goto_prev, opts)

        opts.desc = "Go to next diagnostic"
        k("n", "]d", vim.diagnostic.goto_next, opts)

        opts.desc = "Show documentation for what is under the cursor"
        k("n", "K", vim.lsp.buf.hover, opts)

        opts.desc = "Restart LSP"
        k("n", "<Leader>rs", "<cmd>LspRestart<CR>", opts)
    end

    -- used to enable autocompletion (assign to every lsp server config)
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- change the diagnostic symbols in the sign column (gutter)
    vim.diagnostic.config {
        signs = {
            text = {
                [vim.diagnostic.severity.ERROR] = " ",
                [vim.diagnostic.severity.WARN] = " ",
                [vim.diagnostic.severity.INFO] = "󰠠 ",
                [vim.diagnostic.severity.HINT] = " ",
            },
            -- line number highlight
            numhl = {
                -- [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
                -- [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
                -- [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
                -- [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
            }

        }
    }

    local lspconfig = require("lspconfig")

    vim.diagnostic.config({ virtual_text = false })

    -- configure clangd for C/C++
    lspconfig["clangd"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
    })

    lspconfig["lua_ls"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
            Lua = {
                -- make the language server recognize "vim" global
                diagnostics = {
                    globals = { "vim" },
                },
                workspace = {
                    -- make language server aware of runtime files
                    library = {
                        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                        [vim.fn.stdpath("config") .. "/lua"] = true,
                    },
                },
            },
        },
    })
end

return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
    },
    config = config
}
