local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>pg', builtin.live_grep, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fc', builtin.commands, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fk', builtin.keymaps, { noremap = true, silent = true })
vim.keymap.set('n', "<leader>fd", builtin.lsp_definitions, { noremap = true, silent = true })
vim.keymap.set('n', "<leader>fq", builtin.quickfix, { noremap = true, silent = true })

require("telescope").setup({
    defaults = {
        vimgrep_arguments = {
            "rg",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--no-ignore",
        },
    },
    pickers = {
        find_files = {
            find_command = { "rg", "--files", "--hidden", "--no-ignore", "--max-depth=6" },
        },
    },
})
