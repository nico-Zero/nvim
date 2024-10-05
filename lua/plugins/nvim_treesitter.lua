return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    config = function()
        require("nvim-treesitter.configs").setup({
            sync_install = false,

            ensure_installed = {
                "c",
                "vim",
                "lua",
                "vimdoc",
                "query",
                "python",
                "bash",
            },
            ignore_install = {
                "json",
            },
            auto_install = true,
            highlight = {
                enable = true,
                disable = { "json" },
            },
            indent = {
                enable = true,
                disable = { "json" },
            },
            additional_vim_regex_highlighting = true,
            incremental_selection = {
                enable = true,
                disable = { "json" },
                keymaps = {
                    init_selection = "<C-Space>",
                    node_incremental = "<C-Space>",
                    scope_incremental = false,
                    node_decremental = "<bs>",
                },
            },
            textobjects = {
                enable = true,
                disable = { "json" },
            },
        })
    end,
}
