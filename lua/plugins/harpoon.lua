return {
    "ThePrimeagen/harpoon",
    config = function()
        require("harpoon").setup()
        require("telescope").load_extension('harpoon')
        vim.keymap.set("n", "<leader>a", function()
            require("harpoon.mark").add_file()
            vim.notify("File added to Harpoon!", vim.log.levels.INFO, { title = "Harpoon" })
        end, { noremap = true, silent = true })
        vim.keymap.set("n", "<C-e>", ":lua require('harpoon.ui').toggle_quick_menu()<CR>",
            { noremap = true, silent = true })
        -- vim.keymap.set("n","<C-t>",":Telescope harpoon marks<CR>", { noremap = true, silent = true })
        vim.keymap.set("n", "<leader>jj", ':lua require("harpoon.ui").nav_next()<CR>', { noremap = true, silent = true })
        vim.keymap.set("n", "<leader>kk", ':lua require("harpoon.ui").nav_prev()<CR>', { noremap = true, silent = true })
    end,
}
