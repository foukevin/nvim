return {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_markers = { '.luarc.json', '.luarc.jsonc' },
    settings = { Lua = { diagnostics = { globals = { 'vim' } } } },
    workspace = {
        -- make language server aware of runtime files
        library = {
            [vim.fn.expand('$VIMRUNTIME/lua')] = true,
            [vim.fn.stdpath('config') .. '/lua'] = true,
        },
    },
}
