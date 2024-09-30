return {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    config = function()
        require("lsp_signature").setup({
            bind = true,
            handler_opts = {
                border = "rounded"
            },
            hint_enable = false,
            floating_window = true,
            transparency = 10,
        })
    end
}
