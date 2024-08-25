-- local status_ok, telescope = pcall(require, "telescope")
-- if not status_ok then
--     return
-- end

return {
    'nvim-telescope/telescope.nvim',
    version = '0.1.8',
    event = "VeryLazy",
    config = function ()
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
                    i = { -- Insert mode
                        ["<M-j>"] = "move_selection_next", -- Move to next result
                        ["<M-k>"] = "move_selection_previous", -- Move to previous result
                        ["<C-q>"] = "send_selected_to_qflist", -- Send selected to quickfix list
                    },
                    n = { -- Normal mode
                        ["<M-j>"] = "move_selection_next", -- Move to next result
                        ["<M-k>"] = "move_selection_previous", -- Move to previous result
                        ["<C-q>"] = require('telescope.actions').send_selected_to_qflist + require('telescope.actions').open_qflist, -- Send selected to quickfix list and open it
                    },
                },
            },
            pickers = {
                find_files = {
                    find_command = { "rg", "--files", "--hidden", "--no-ignore", "--max-depth=6" },
                },
            },
        })
    end,
}
