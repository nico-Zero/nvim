-- 1.Telescoperemp
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>pg', builtin.live_grep, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fc', builtin.commands, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fk', builtin.keymaps, { noremap = true, silent = true })
vim.keymap.set('n', "<leader>fd", builtin.lsp_definitions, { noremap = true, silent = true })
vim.keymap.set('n', "<leader>fq", builtin.quickfix, { noremap = true, silent = true })
vim.keymap.set('n', "<leader>fgs", builtin.git_status, { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'z=', '<NOP>', { noremap = true, silent = true })
vim.keymap.set('n', "<leader>z", builtin.spell_suggest, { noremap = true, silent = true })
-- vim.keymap.set('n', "<A-j>", builtin.scroll{count = 1}, { noremap = true, silent = true })
-- vim.keymap.set('n', "<A-k>", builtin.scroll{count = -1}, { noremap = true, silent = true })

-- 2.Treesitter
-- 3.Nvim-Tree
vim.keymap.set( {"n","v"}, "<leader>t-", ":NvimTreeResize -5<CR>", { noremap = true, silent = true })
vim.keymap.set( {"n","v"}, "<leader>t+", ":NvimTreeResize +5<CR>", { noremap = true, silent = true })
vim.keymap.set( "n", "<leader>pv", "<Cmd>Noice dismiss<CR>|<Cmd>NvimTreeToggle<CR>", { noremap = true, silent = true })

-- 4.Tokyo-Night-Theam
-- 5.Mini.Pair
-- 6.LuaLine
-- 7.Indent-Blankline
-- 8.ToggleTerm
-- 9.Code-Runner
vim.keymap.set('n', '<leader>r', ':RunCode<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>rf', ':RunFile<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>rt', ':RunFile tab<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>rp', ':RunProject<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>rc', ':RunClose<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>crf', ':CRFiletype<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>crp', ':CRProjects<CR>', { noremap = true, silent = true })

-- 10.Drassing
-- 11.GitSigns
-- 12.Mason
vim.keymap.set( "n", "<leader>pm", ":Mason<CR>", { noremap = true, silent = true })

-- 13.Nvim-Cmp
-- 14.LuaSnip
local ls = require("luasnip")
vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})

vim.keymap.set({"i", "s"}, "<C-E>", function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end, {silent = true})

-- 15.Harpoon
vim.keymap.set("n","<leader>a",":lua require('harpoon.mark').add_file()<CR>", { noremap = true, silent = true })
vim.keymap.set("n","<C-e>",":lua require('harpoon.ui').toggle_quick_menu()<CR>", { noremap = true, silent = true })
vim.keymap.set("n","<C-t>",":Telescope harpoon marks<CR>", { noremap = true, silent = true })
vim.keymap.set("n","<leader>jj",':lua require("harpoon.ui").nav_next()<CR>', { noremap = true, silent = true })
vim.keymap.set("n","<leader>kk",':lua require("harpoon.ui").nav_prev()<CR>', { noremap = true, silent = true })

-- 16.Comment
-- 17.Scroll-bar
-- 18.Surround
-- 19.Nvim-ts-AutoTag
-- 20.Trouble
vim.keymap.set( "n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { noremap = true, silent = true })
vim.keymap.set( "n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { noremap = true, silent = true })
vim.keymap.set( "n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", { noremap = true, silent = true })
vim.keymap.set( "n", "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", { noremap = true, silent = true })
vim.keymap.set( "n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", { noremap = true, silent = true })
vim.keymap.set( "n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", { noremap = true, silent = true })

-- 21.Multi-Line-Courser
vim.keymap.set( {"n", "x"}, "<A-j>", "<Cmd>MultipleCursorsAddDown<CR>", { noremap = true, silent = true })
vim.keymap.set( {"n", "x"}, "<A-k>", "<Cmd>MultipleCursorsAddUp<CR>", { noremap = true, silent = true })
vim.keymap.set( {"n", "x"}, "<C-LeftMouse>", "<Cmd>MultipleCursorsMouseAddDelete<CR>", { noremap = true, silent = true })
vim.keymap.set( {"n", "x"}, "<leader>cm", "<Cmd>MultipleCursorsAddMatches<CR>", { noremap = true, silent = true })
vim.keymap.set( {"n", "x"}, "<leader>cM", "<Cmd>MultipleCursorsAddMatchesV<CR>", { noremap = true, silent = true })
vim.keymap.set( {"n", "x"}, "<leader>cd", "<Cmd>MultipleCursorsAddJumpNextMatch<CR>", { noremap = true, silent = true })
vim.keymap.set( {"n", "x"}, "<leader>cD", "<Cmd>MultipleCursorsJumpNextMatch<CR>", { noremap = true, silent = true })
vim.keymap.set( {"n", "x"}, "<leader>cl", "<Cmd>MultipleCursorsLock<CR>", { noremap = true, silent = true })

-- 22.Nvim-Conda
vim.keymap.set( "n", "<leader>ca", ":CondaActivate<CR>", { noremap = true, silent = true })

-- 23.HexEditor
vim.keymap.set( "n", "<leader>ht", ":HexToggle<CR>", { noremap = true, silent = true })

-- 24.MarkDownPreview
vim.keymap.set( "n", "<leader>mdt", "<Plug>MarkdownPreviewToggle", { noremap = true, silent = true })

-- 25.NavBuddy
vim.keymap.set( "n", "<leader>sf", "<cmd>Navbuddy<CR>", { noremap = true, silent = true })

-- 26.Nvim-Cursorline
-- 27.Noice
vim.keymap.set( "n", "<leader>nd", "<cmd>Noice dismiss<CR>" ,{ noremap = true, silent = true })

-- 28.LuaRocks
-- 29.Nvim-Treesitter-Context
-- 30.Nvim-Colorizer
-- 31.Oil.Nvim
local oil = require("oil")
vim.keymap.set( "n", "-", oil.open_float, { desc = "Open parent directory", noremap = true, silent = true })

-- 32.Undotree
vim.keymap.set( "n", "<F5>", "<cmd>UndotreeToggle<CR>", { noremap = true, silent = true })
