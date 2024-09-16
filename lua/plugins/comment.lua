return{
    'numToStr/Comment.nvim',
    event = "VeryLazy",
    config = function ()
        require('Comment').setup()
        vim.keymap.set( "n", "gcs", "vas<Plug>(comment_toggle_linewise_visual)", { noremap = true, silent = true })
        vim.keymap.set( "n", "gca", "<Plug>(comment_toggle_)", { noremap = true, silent = true })

    end,

}
