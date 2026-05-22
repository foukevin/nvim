-- Set default root markers for all clients
vim.lsp.config('*', {
    capabilities = {
        textDocument = {
            semanticTokens = {
                multilineTokenSupport = true,
            }
        }
    },
    root_markers = { ".git" },
})

vim.diagnostic.config({
    virtual_text = false,
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
        },
    },
})

local create_lsp_keymap = function()
    local fzf = require("fzf-lua")
    local wk = require("which-key")
    wk.add({
        mode = "n",
        buffer = 0,
        { "g",         group = "LSP" },

        { "gR",        vim.lsp.buf.references,       desc = "Show references" },
        { "gd",        vim.lsp.buf.definition,       desc = "Go to definition" },
        { "gi",        vim.lsp.buf.implementation,   desc = "Show implementations" },
        { "gt",        vim.lsp.buf.type_definition,  desc = "Show type definitions" },
        { "<Leader>D", fzf.lsp_document_diagnostics, desc = "Show buffer diagnostics" },

        -- LSP buffer
        { "gD",        vim.lsp.buf.declaration,      desc = "Go to declaration" },
        {
            "K",
            function() vim.lsp.buf.hover { border = 'rounded', max_height = 25, max_width = 120 } end,
            desc = "Show documentation for what is under the cursor"
        },
        { "<Leader>rn", vim.lsp.buf.rename,        desc = "Smart rename" },
        { "<Leader>ca", fzf.lsp_code_actions,      desc = "Show available code actions" },

        -- diagnostic
        { "<Leader>d",  vim.diagnostic.open_float, desc = "Show line diagnostics" },
    })
end

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('my.lsp', {}),
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        if client:supports_method('textDocument/implementation') then
            -- Create a keymap for vim.lsp.buf.implementation ...
            create_lsp_keymap()
        end

        -- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
        if client:supports_method('textDocument/completion') then
            -- Optional: trigger autocompletion on EVERY keypress. May be slow!
            -- local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
            -- client.server_capabilities.completionProvider.triggerCharacters = chars

            vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
        end

        -- Auto-format ("lint") on save.
        -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
        if not client:supports_method('textDocument/willSaveWaitUntil')
            and client:supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
                group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
                buffer = args.buf,
                callback = function()
                    vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
                end,
            })
        end
    end,
})

vim.lsp.enable({
    "clangd",
    "luals",
    "cmakels",
    "pythonls",
    "mesonls"
})
