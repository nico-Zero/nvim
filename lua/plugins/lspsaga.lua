return {
    'nvimdev/lspsaga.nvim',
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        require('lspsaga').setup({
            ui = {
                border = "rounded"
            },
            diagnostic = {
                enable = true,
                max_height = 0.8,
                keys = {
                    quit = { 'q', '<ESC>', "C-c>" }
                }
            },
            rename = {
                enable = true,
                keys = {
                    quit = { '<C-c>', '<ESC>' }
                }
            },
            -- Disable all other features
            code_action = {
                enable = false,
                keys = {
                    quit = { 'q', '<ESC>', "C-c>" }
                }
            },
            lightbulb = {
                enable = false,
                keys = {
                    quit = { 'q', '<ESC>', "C-c>" }
                }
            },
            hover = {
                enable = false,
                keys = {
                    quit = { 'q', '<ESC>', "C-c>" }
                }
            },
            finder = {
                enable = false,
                keys = {
                    quit = { 'q', '<ESC>', "C-c>" }
                }
            },
            definition = {
                enable = false,
                keys = {
                    quit = { 'q', '<ESC>', "C-c>" }
                }
            },
            implement = {
                enable = false,
                keys = {
                    quit = { 'q', '<ESC>', "C-c>" }
                }
            },
            signature_help = {
                enable = false,
                keys = {
                    quit = { 'q', '<ESC>', "C-c>" }
                }
            },
            symbol_in_winbar = {
                enable = false,
                keys = {
                    quit = { 'q', '<ESC>', "C-c>" }
                }
            },
        })

        local map = vim.keymap.set
        map("n", "<leader>rn", "<CMD>Lspsaga rename<CR>", { noremap = true, silent = true })
        map("n", "<leader>e<CR>", "<CMD>Lspsaga show_buf_diagnostics<CR>", { noremap = true, silent = true })
        map("n", "<leader>ee<CR>", "<CMD>Lspsaga show_line_diagnostics<CR>", { noremap = true, silent = true })
    end,
}
