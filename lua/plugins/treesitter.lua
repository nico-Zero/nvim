return{
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    event = "VeryLazy",
    config = function ()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "c",
                "vim",
                "lua",
                "vimdoc",
                "query",
                "python",
                "bash",
            },
            auto_install = true,
            highlight = {
                enable = true,
            },
            additional_vim_regex_highlighting = true,

        })
    end,

}
