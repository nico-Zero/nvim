return{
    'Vigemus/iron.nvim',
    ft = {"python"},
    config = function ()
        local iron = require("iron.core")

        iron.setup {
            config = {
                visibility = require("iron.visibility").toggle,
                scratch_repl = true,
                repl_definition = {
                    sh = {
                        command = {"zsh"}
                    },
                    python = require("iron.fts.python").ipython,
                },

                repl_open_cmd = require('iron.view').split.vertical.botright(80)
            },

            keymaps = {
                send_motion = "<space>sc",
                visual_send = "<space>sc",
                send_file = "<space>sf",
                send_line = "<space>sl",
                send_paragraph = "<space>sp",
                send_until_cursor = "<space>su",
                send_mark = "<space>sm",
                mark_motion = "<space>mc",
                mark_visual = "<space>mc",
                remove_mark = "<space>md",
                cr = "<space>s<cr>",
                interrupt = "<space>s<space>",
                exit = "<space>sq",
                clear = "<space>cl",
            },

            highlight = {
                italic = true
            },
            ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
        }

        -- iron also has a list of commands, see :h iron-commands for all available commands
        vim.keymap.set('n', '<space>rf', '<cmd>IronRepl<cr>', { noremap = true, silent = true })
        vim.keymap.set('n', '<space>rr', '<cmd>IronRestart<cr>', { noremap = true, silent = true })
        vim.keymap.set('n', '<space>rs', '<cmd>IronFocus<cr>', { noremap = true, silent = true })
        vim.keymap.set('n', '<space>rh', '<cmd>IronHide<cr>', { noremap = true, silent = true })
    end
}
