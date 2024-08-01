return{
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
        require('dashboard').setup({
            config = {
                header = require("ascii").art.text.neovim.sharp,
                shortcut = {},
                packages = {
                    enable = true,
                },
                footer = {},
            }
        })

    end,
    dependencies = { {'nvim-tree/nvim-web-devicons'}}
}
