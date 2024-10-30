return {
    "rmagatti/auto-session",
    config = function()
        local auto_session = require("auto-session")

        auto_session.setup({
            auto_restore_enabled = false,
            auto_session_suppress_dirs = { "~/", "~/Downloads", "~/Documents", "~/Desktop/" },
        })

        local wk = require("which-key")
        wk.add({
            { mode = "n" },
            { "<Leader>w", group = "Auto-session"},
            -- restore last workspace session for current directory
            { "<Leader>wr", "<cmd>SessionRestore<CR>", desc = "Restore session for cwd" },
            -- save workspace session for current working directory
            { "<Leader>ws", "<cmd>SessionSave<CR>", desc = "Save session for auto session root dir" },
        })
    end,
}
