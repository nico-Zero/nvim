return {
    'nvim-telescope/telescope.nvim',
    version = '0.1.8',
    event = "VeryLazy",
    config = function ()
        require("telescope").setup({
            defaults = {
                vimgrep_arguments = {
                    "rg",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--smart-case",
                    "--no-ignore",
                },
            },
            pickers = {
                find_files = {
                    find_command = { "rg", "--files", "--hidden", "--no-ignore", "--max-depth=6" },
                },
            },
        })
    end,
}
