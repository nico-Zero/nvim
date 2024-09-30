return {
    'MeanderingProgrammer/render-markdown.nvim',
    opts = {},
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    config = function()
        local render_markdown = require("render-markdown")
        render_markdown.setup()
        vim.keymap.set("n", "<leader>md", render_markdown.toggle, { noremap = true, silent = true })
    end
}
