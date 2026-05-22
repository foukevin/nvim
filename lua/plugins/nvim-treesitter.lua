-- https://www.qu8n.com/posts/treesitter-migration-guide-for-nvim-0-12
-- https://samuellawrentz.com/blog/nvim-treesitter-archived-neovim-0-12-migration
return {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    build = ':TSUpdate',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
        'windwp/nvim-ts-autotag',
    },

    init = function()
        -- ensure these language parsers are installed
        local ensureInstalled = {
            'c', 'cpp',
            'hlsl', 'glsl',
            'gitignore',
            'markdown', 'markdown_inline',
            'lua', 'python',
            'vim',
        }
        local alreadyInstalled = require('nvim-treesitter.config').get_installed()
        local parsersToInstall = vim.iter(ensureInstalled)
            :filter(function(parser)
                return not vim.tbl_contains(alreadyInstalled, parser)
            end)
            :totable()
        require('nvim-treesitter').install(parsersToInstall)
    end,
}
