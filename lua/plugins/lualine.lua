return{
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons'},
    config = function ()
        require('lualine').setup({
            options = {
                theme = "tokyonight",
            },
            sections = {
                lualine_x = {
                    {
                        function() return require("noice").api.status.mode.get() end,
                        cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end
                    },
                },
            },
        })
    end
}
