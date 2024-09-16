return{
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },

    config = function ()
        require("nvim-tree").setup({
            sort = {
                sorter = "case_sensitive",
            },
            view = {
                width = 30,
                side = "right",
            },
            renderer = {
                group_empty = true,
            },
            git = {
                ignore = false,
            },
        })
        vim.keymap.set( {"n","v"}, "<leader>t-", ":NvimTreeResize -5<CR>", { noremap = true, silent = true })
        vim.keymap.set( {"n","v"}, "<leader>t+", ":NvimTreeResize +5<CR>", { noremap = true, silent = true })
        vim.keymap.set( "n", "<leader>pv", "<Cmd>Noice dismiss<CR>|<Cmd>NvimTreeToggle<CR>", { noremap = true, silent = true })

    end,

}

