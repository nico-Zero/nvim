return {
    "stevearc/dressing.nvim",
    config = function()
        require("dressing").setup({
            input = {
                enabled = true,
            },
            select = {
                enabled = false, -- Disable select component, only use for input
            },
        })
    end,
}
