local config = function()
    -- local keymap = vim.api.nvim_set_keymap

    local opts = { noremap = true, silent = true }

    -- Only set up keymap when LSP activates for a buffer
    local on_attach = function(_, bufnr)
        local builtin = require("telescope.builtin")
        local wk = require("which-key")
        wk.add({
            mode = "n",
            buffer = 0,
            { "g", group = "LSP" },

            { "<Leader>rs", "<cmd>LspRestart<CR>", desc = "Restart LSP" },

            -- TeleScope
            { "gR", builtin.lsp_references, desc = "Show LSP references" },
            { "gd", builtin.lsp_definitions, desc = "Show LSP definitions" },
            { "gi", builtin.lsp_implementations, desc = "Show LSP implementations" },
            { "gt", builtin.lsp_type_definitions, desc = "Show LSP type definitions" },
            { "<Leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", desc = "Show buffer diagnostics" },

            -- LSP buffer
            { "gD", vim.lsp.buf.declaration, desc = "Go to declaration" },
            { "K",  vim.lsp.buf.hover, desc = "Show documentation for what is under the cursor" },
            { "<Leader>rn", vim.lsp.buf.rename, desc = "Smart rename" },
            { "<Leader>ca", vim.lsp.buf.code_action, desc = "Show available code actions" },

            -- diagnostic
            { "<Leader>d", vim.diagnostic.open_float, desc = "Show line diagnostics" },
        })

        -- set keybinds
        --keymap("n", "gR", builtin.lsp_references, { desc = "Show LSP references" })
        --keymap("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
        --keymap("n", "gd", "<cmd>Telescope lsp_definitions<CR>", { desc = "Show LSP definitions" })
        --keymap("n", "gi", "<cmd>Telescope lsp_implementations<CR>", { desc = "Show LSP implementations" })
        --keymap("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", { desc = "Show LSP type definitions" })
        --keymap({ "n", "v" }, "<Leader>ca", vim.lsp.buf.code_action, { desc = "Show available code actions" })
        --keymap("n", "<Leader>rn", vim.lsp.buf.rename, { desc = "Smart rename" })
        -- keymap("n", "<Leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", { desc = "Show buffer diagnostics" })
        --keymap("n", "<Leader>d", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
        -- keymap("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
        -- keymap("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
        --keymap("n", "K", vim.lsp.buf.hover, { desc = "Show documentation for what is under the cursor" })
        --keymap("n", "<Leader>rs", "<cmd>LspRestart<CR>", { desc = "Restart LSP" })
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

    vim.diagnostic.config({ virtual_text = false })

    -- vim.lsp.config('clangd', {
    --     cmd = { 'clangd' },
    --     filetypes = { 'c', 'cpp' },
    --     on_attach = on_attach,
    -- })

    local lspconfig = require("lspconfig")
    -- configure clangd for C/C++
    -- lspconfig["clangd"].setup({
    --     capabilities = capabilities,
    --     on_attach = on_attach,
    -- })

    lspconfig.clangd.setup({
        capabilities = capabilities,
        on_attach = on_attach,
    })

    lspconfig.lua_ls.setup({
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
