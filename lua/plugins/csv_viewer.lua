return {
    "hat0uma/csvview.nvim",
    config = function()
        require("csvview").setup()
        local map = vim.keymap.set
        map("n", "<leader>vv", ":CsvViewToggle<CR>", { noremap = true, silent = true })
    end,
}
