return {
    "smjonas/inc-rename.nvim",
    config = function()
        require("inc_rename").setup({
            input_buffer_type = nil,
        })
        -- vim.api.nvim_set_keymap("n", "<leader>rn", ":IncRename ", { noremap = true, silent = true })
        vim.keymap.set("n", "<leader>rn", function()
            return ":IncRename " .. vim.fn.expand("<cword>")
        end, { expr = true })
    end
}
