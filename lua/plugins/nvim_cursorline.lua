return{
    "yamatsum/nvim-cursorline",
    config = function ()
        require('nvim-cursorline').setup {
            cursorline = {
                enable = false,
                number = false,
            },
            cursorword = {
                enable = false,
                min_length = 3,
                hl = { underline = false },
            }
        }

    end,

}
