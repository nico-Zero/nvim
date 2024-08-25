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
                        ["<leader>pa"] = "@parameter.inner",
                        ["<leader>pf"] = "@function.outer",
                    },
                }
            },
        })
    end
}
