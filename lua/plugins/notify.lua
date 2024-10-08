return {
    "rcarriga/nvim-notify",
    config = function()
        require("notify").setup({
            background_colour = "NotifyBackground",
            fps = 60,
            icons = {
                DEBUG = "",
                ERROR = "",
                INFO = "",
                TRACE = "✎",
                WARN = ""
            },
            minimum_width = 50,
            render = "compact",
            stages = "fade_in_slide_out",
            timeout = 50,
            level = require("notify").level,
        })
        vim.notify = require("notify")
        vim.keymap.set("n", "<leader>nd", require("notify").dismiss, { noremap = true, silent = true })
    end,
}
