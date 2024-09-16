return{
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
    event = "VeryLazy",
    config = function ()
        vim.keymap.set( "n", "<leader>mdt", "<Plug>MarkdownPreviewToggle", { noremap = true, silent = true })

    end,

}
