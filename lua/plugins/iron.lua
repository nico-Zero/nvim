return{
    'Vigemus/iron.nvim',
    ft = {"python"},
    config = function ()
        local iron = require("iron.core")
        local view = require("iron.view")
        iron.setup {
            config = {
                visibility = require("iron.visibility").toggle,
                scratch_repl = true,
                repl_definition = {
                    sh = {
                        command = {"zsh"}
                    },
                    python = {
                        command = {
                            "ipython",
                            "-i",
                            "--pprint",
                            "--no-autoindent",
                            "--no-simple-prompt",
                        }
                    }
                },

                repl_open_cmd = view.split.vertical.botright(80)
                -- repl_open_cmd = view.right(80)
            },

            keymaps = {
                send_motion = "<space>rc",
                visual_send = "<space>rc",
                send_file = "<space>rf",
                send_line = "<space>rl",
                send_paragraph = "<space>rp",
                send_until_cursor = "<space>ru",
                send_mark = "<space>rm",
                mark_motion = "<space>mc",
                mark_visual = "<space>mc",
                remove_mark = "<space>md",
                cr = "<space>s<cr>",
                interrupt = "<space>r<space>",
                exit = "<space>rq",
                clear = "<space>cl",
            },

            highlight = {
                italic = true
            },
        }

        -- iron also has a list of commands, see :h iron-commands for all available commands
        -- vim.keymap.set('n', '<space>sf', '<cmd>IronRepl<cr>', { noremap = true, silent = true })
        vim.keymap.set('n', '<space>sr', '<cmd>IronRestart<cr>', { noremap = true, silent = true })
        -- vim.keymap.set('n', '<space>ss', '<cmd>IronFocus<cr>', { noremap = true, silent = true })
        -- vim.keymap.set('n', '<space>sh', '<cmd>IronHide<cr>', { noremap = true, silent = true })
    end
}
