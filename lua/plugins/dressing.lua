return {
    "stevearc/dressing.nvim",
    config = function()
        require("dressing").setup({
            input = {
                enabled = true,
            },
            select = {
                enabled = false,
            },
        })
    end,
}
