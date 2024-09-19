return{
    'numToStr/Comment.nvim',
    event = "VeryLazy",
    config = function ()
        require('Comment').setup()
        vim.keymap.set( "n", "gcp", "vip<Plug>(comment_toggle_linewise_visual)", { noremap = true, silent = true })
        vim.keymap.set( "n", "gcf", "vaf<Plug>(comment_toggle_linewise_visual)", { noremap = true, silent = true })
        vim.keymap.set( "n", "gca", "<Plug>(comment_toggle_)", { noremap = true, silent = true })
    end,
}
