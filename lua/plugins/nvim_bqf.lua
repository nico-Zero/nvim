return {
    "kevinhwang91/nvim-bqf",
    config = function()
        require("bqf").setup({
            auto_enable = true,        -- Automatically enable bqf in quickfix lists
            auto_resize_height = true, -- Automatically resize height
            preview = {
                win_height = 12,       -- Height of the preview window
                delay_syntax = 80,     -- Delay for syntax highlight
                border = 'single',     -- Border style of the preview window
                show_title = true,     -- Show title in preview window
            },
            func_map = {
                split = 'sp',   -- Map split to `sp`
                vsplit = 'vsp', -- Map vsplit to `vsp`
                ptoggle = 'p',  -- Toggle preview
                tab = 'tabe',   -- Map tab to `tabe`
            },
        })
        function ToggleBQF()
            -- Get the ID of the quickfix window (0 if it’s not open)
            local qf_winid = vim.fn.getqflist({ winid = 0 }).winid

            if qf_winid ~= 0 then
                -- Quickfix window is open; close it
                vim.cmd('cclose')
            else
                -- Quickfix window is not open; open it if there are entries
                if not vim.tbl_isempty(vim.fn.getqflist()) then
                    vim.cmd('copen')
                else
                    print("Quickfix list is empty.")
                end
            end
        end

        local map = vim.keymap.set
        map('n', '<M-n>', '<cmd>cnext<CR>zz', { noremap = true, silent = true })
        map('n', '<M-p>', '<cmd>cprev<CR>zz', { noremap = true, silent = true })
        map('n', '<leader>qq', ToggleBQF, { noremap = true, silent = true })
        map('n', '<leader>qn', '<cmd>cnewer<CR>', { noremap = true, silent = true })
        map('n', '<leader>qp', '<cmd>colder<CR>', { noremap = true, silent = true })
    end,
}
