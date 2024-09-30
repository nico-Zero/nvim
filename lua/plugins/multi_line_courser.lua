return {
    "brenton-leighton/multiple-cursors.nvim",
    version = "*",
    config = function()
        require("multiple-cursors").setup()
        vim.keymap.set({ "n", "x" }, "<A-j>", "<Cmd>MultipleCursorsAddDown<CR>", { noremap = true, silent = true })
        vim.keymap.set({ "n", "x" }, "<A-k>", "<Cmd>MultipleCursorsAddUp<CR>", { noremap = true, silent = true })
        vim.keymap.set({ "n", "x" }, "<C-LeftMouse>", "<Cmd>MultipleCursorsMouseAddDelete<CR>",
            { noremap = true, silent = true })
        vim.keymap.set({ "n", "x" }, "<leader>cm", "<Cmd>MultipleCursorsAddMatches<CR>",
            { noremap = true, silent = true })
        vim.keymap.set({ "n", "x" }, "<leader>cM", "<Cmd>MultipleCursorsAddMatchesV<CR>",
            { noremap = true, silent = true })
        vim.keymap.set({ "n", "x" }, "<leader>cd", "<Cmd>MultipleCursorsAddJumpNextMatch<CR>",
            { noremap = true, silent = true })
        vim.keymap.set({ "n", "x" }, "<leader>cD", "<Cmd>MultipleCursorsJumpNextMatch<CR>",
            { noremap = true, silent = true })
        vim.keymap.set({ "n", "x" }, "<leader>cl", "<Cmd>MultipleCursorsLock<CR>", { noremap = true, silent = true })
    end,
}
