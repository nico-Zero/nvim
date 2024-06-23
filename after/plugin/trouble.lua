local trouble = require("trouble")
trouble.setup(
{
    modes = {
        preview_float = {
            mode = "diagnostics",
            preview = {
                type = "float",
                relative = "editor",
                border = "rounded",
                title = "Preview",
                title_pos = "center",
                position = { 0, -2 },
                size = { width = 0.3, height = 0.3},
                zindex = 200,
            },
        },
    },
}
)
vim.keymap.set( "n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>")
vim.keymap.set( "n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>")
vim.keymap.set( "n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>")
vim.keymap.set( "n", "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>")
vim.keymap.set( "n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>")
vim.keymap.set( "n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>")
