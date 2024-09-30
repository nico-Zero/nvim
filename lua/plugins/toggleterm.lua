return {
    "akinsho/toggleterm.nvim",
    config = function()
        require("toggleterm").setup({
            size = 20,
            start_in_insert = true,
            open_mapping = [[<A-,>]],
            direction = "float",
            autochdir = true,
            on_create = function()
                vim.cmd("TermExec cmd='clear'")
            end,
            float_opts = {
                border = 'curved',
                width = function()
                    return math.floor(vim.o.columns * 0.4)
                end,
                height = function()
                    return vim.o.lines - 5
                end,
                winblend = 3,
                -- Position the float on the right side
                row = 1,
                col = function()
                    return math.floor(vim.o.columns * 0.6)
                end,
            }
        })
    end,
}
