return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    local treesitter = require("nvim-treesitter.configs")

    -- configure treesitter --
    treesitter.setup({
      -- enable syntax highlighting
      highlight = { enable = true },
      -- enable indentation
      -- indent = { enable = true },
      -- enable autotagging (with nvim-ts-autotag plugin)
      autotag = { enable = true },
      -- ensure these language parsers are installed
      ensure_installed = {
        "c",
        "cpp",
        "hlsl",
        "glsl",
        "gitignore",
        "markdown",
        "markdown_inline",
        "lua",
        "vim",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "ts", --"<C-Space>",
          node_incremental = "]", --"<C-Space>",
          scope_incremental = false,
          node_decremental = "[",
        },
      },
    })
  end,
}
