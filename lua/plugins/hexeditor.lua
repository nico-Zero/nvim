return {
    'RaafatTurki/hex.nvim',
    config = function()
        require "hex".setup({
            dump_cmd = "xxd -g 1 -u",
            assemble_cmd = "xxd -r",
        })
        vim.keymap.set("n", "<leader>ht", ":HexToggle<CR>", { noremap = true, silent = true })
    end,

}
