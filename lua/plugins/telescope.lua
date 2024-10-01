-- local status_ok, telescope = pcall(require, "telescope")
-- if not status_ok then
--     return
-- end

return {
    'nvim-telescope/telescope.nvim',
    version = '0.1.8',
    event = "VeryLazy",
    config = function()
        local actions = require('telescope.actions')
        local action_state = require('telescope.actions.state')

        local open_help_in_vertical_split = function(prompt_bufnr)
            local selection = action_state.get_selected_entry()
            actions.close(prompt_bufnr)
            if selection and selection.value then
                vim.cmd("vert help " .. selection.value)
            end
        end
        local open_man_pages_in_vertical_split = function(prompt_bufnr)
            local selection = action_state.get_selected_entry()
            actions.close(prompt_bufnr)
            if selection and selection.value then
                vim.cmd("vert Man " .. selection.value)
            end
        end
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
                mappings = {
                    i = {
                        ["<M-j>"] = "move_selection_next",
                        ["<M-k>"] = "move_selection_previous",
                        ["<C-q>"] = require('telescope.actions').smart_send_to_qflist,
                        ["<C-Q>"] = require('telescope.actions').smart_add_to_qflist,
                        ["<C-s>"] = function(prompt_bufnr)
                            local selection = action_state.get_selected_entry()
                            vim.fn.system('nsxiv ' .. selection.path)
                        end,

                        ["<M-CR>"] = function(prompt_bufnr)
                            actions.file_vsplit(prompt_bufnr)
                        end,
                    },
                    n = {
                        ["<M-j>"] = "move_selection_next",
                        ["<M-k>"] = "move_selection_previous",
                        ["<C-q>"] = require('telescope.actions').smart_send_to_qflist,
                        ["<C-Q>"] = require('telescope.actions').smart_add_to_qflist,
                        ["<C-s>"] = function(prompt_bufnr)
                            local selection = action_state.get_selected_entry()
                            vim.fn.system('nsxiv ' .. selection.path)
                        end,
                        ["<M-CR>"] = function(prompt_bufnr)
                            actions.file_vsplit(prompt_bufnr)
                        end,
                    },
                },
            },
            pickers = {
                help_tags = {
                    mappings = {
                        i = {
                            ["<CR>"] = open_help_in_vertical_split
                        },
                        n = {
                            ["<CR>"] = open_help_in_vertical_split
                        }
                    }
                },
                man_pages = {
                    mappings = {
                        i = {
                            ["<CR>"] = open_man_pages_in_vertical_split
                        },
                        n = {
                            ["<CR>"] = open_man_pages_in_vertical_split
                        },
                    }
                },
                find_files = {
                    find_command = { "rg", "--files", "--hidden", "--no-ignore", "--max-depth=6" },
                },
            },
        })
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, { noremap = true, silent = true })
        vim.keymap.set('n', '<leader>pg', builtin.live_grep, { noremap = true, silent = true })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { noremap = true, silent = true })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { noremap = true, silent = true })
        vim.keymap.set('n', '<leader>fc', builtin.commands, { noremap = true, silent = true })
        vim.keymap.set('n', '<leader>fk', builtin.keymaps, { noremap = true, silent = true })
        vim.keymap.set('n', "<leader>df", builtin.treesitter, { noremap = true, silent = true })
        vim.keymap.set('n', "<leader>fq", builtin.quickfix, { noremap = true, silent = true })
        vim.keymap.set('n', "<leader>fgs", builtin.git_status, { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', 'z=', '<NOP>', { noremap = true, silent = true })
        vim.keymap.set('n', "<leader>z", builtin.spell_suggest, { noremap = true, silent = true })
        vim.keymap.set('n', "<leader>nm", ":Telescope notify<CR>", { noremap = true, silent = true })
        vim.keymap.set('n', "<leader>fm", builtin.man_pages, { noremap = true, silent = true })
    end,
}
