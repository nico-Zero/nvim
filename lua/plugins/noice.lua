return{
    "folke/noice.nvim",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
    config = function ()
        require("noice").setup()
        vim.keymap.set( "n", "<leader>nd", "<cmd>Noice dismiss<CR>" ,{ noremap = true, silent = true })

    end,

}
