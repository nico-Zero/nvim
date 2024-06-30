local harpoon = require("harpoon")
harpoon.setup()

vim.keymap.set("n","<leader>a",":lua require('harpoon.mark').add_file()<CR>", { noremap = true, silent = true })
vim.keymap.set("n","<C-e>",":lua require('harpoon.ui').toggle_quick_menu()<CR>", { noremap = true, silent = true })

