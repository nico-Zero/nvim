return{
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile"},
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
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
            indent = {
                enable = true,
            },
            additional_vim_regex_highlighting = true,
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-Space>",
                    node_incremental = "<C-Space>",
                    scope_incremental = false,
                    node_decremental = "<bs>",
                },
            },

        })
    end,

}
