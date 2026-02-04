local M = {}

local colors = {
    bg = '#101010',
    fg = '#D8D8D8',
    grey = '#808080',
    yellow = '#D8B8A0',
    magenta = '#D8A0D8',
    cyan = '#B0D8F8'
}

function M.colorscheme()
    vim.cmd 'highlight clear'
    vim.cmd 'syntax reset'

    vim.o.background = 'dark'
    vim.g.colors_name = 'papadox'

    local set = vim.api.nvim_set_hl

    set(0, 'Normal', { bg = colors.bg, fg = colors.fg })
    set(0, 'Comment', { fg = colors.grey, italic = true })
    set(0, 'Keyword', { fg = colors.fg })
    set(0, 'Type', { fg = colors.fg })
    set(0, 'Identifier', { fg = colors.fg })
    set(0, 'Function', { fg = colors.cyan })
    -- set(0, 'String', { fg = colors.cyan })
    -- set(0, 'Number', { fg = colors.cyan })
    set(0, 'Constant', { fg = colors.magenta })
end

return M
