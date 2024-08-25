return{
    "nvim-treesitter/nvim-treesitter-textobjects",
    lazy = true,
    config = function ()
        require("nvim-treesitter.configs").setup({
            textobjects = {
                select = {
                    lookahead = true,
                    -- Automatically jump forward to textobj, similar to targets.vim
                    enable = true,
                    keymaps = {
                        -- You can use the capture groups defined in textobjects.scm
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",

                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",

                        ["ab"] = "@block.outer",
                        ["ib"] = "@block.inner",

                        ["al"] = "@loop.outer",
                        ["il"] = "@loop.inner",

                        ["ar"] = "@return.outer",
                        ["ir"] = "@return.inner",

                        ["aa"] = "@assignment.outer",
                        ["ia"] = "@assignment.rhs",

                        ["ap"] = "@parameter.outer",
                        ["ip"] = "@parameter.inner",

                        -- You can also use captures from other query groups like `locals.scm`
                        ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
                    },
                },
                swap = {
                    enable = true,
                    swap_next = {
                        ["<leader>na"] = "@parameter.inner",
                        ["<leader>nf"] = "@function.outer",
                    },
                    swap_previous = {
                        ["<leader>Na"] = "@parameter.inner",
                        ["<leader>Nf"] = "@function.outer",
                    },
                }
            },
        })
        local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")

        vim.keymap.set({"n","x","o"}, ";", ts_repeat_move.repeat_last_move_next)
        vim.keymap.set({"n","x","o"}, ",", ts_repeat_move.repeat_last_move_opposite)
        vim.keymap.set({"n","x","o"}, "f", ts_repeat_move.builtin_f_expr)
        vim.keymap.set({"n","x","o"}, "F", ts_repeat_move.builtin_F_expr)
        vim.keymap.set({"n","x","o"}, "t", ts_repeat_move.builtin_t_expr)
        vim.keymap.set({"n","x","o"}, "T", ts_repeat_move.builtin_T_expr)
    end,
}
