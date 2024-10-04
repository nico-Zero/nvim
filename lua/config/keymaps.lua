local map = vim.keymap.set
-- map("n", "<A-h>", "V<", { noremap = true, silent = true })
-- map("n", "<A-l>", "V>", { noremap = true, silent = true })
-- map("v", "<A-h>", "<", { noremap = true, silent = true })
-- map("v", "<A-l>", ">", { noremap = true, silent = true })
map("n", "<leader>ss", ":sp<CR>", { noremap = true, silent = true })
map("n", "<leader>sv", ":vsp<CR>", { noremap = true, silent = true })
map("n", "<leader>wc", ":close<CR>", { noremap = true, silent = true })
map("n", "<leader>wh", ":wincmd h<CR>", { noremap = true, silent = true })
map("n", "<leader>wj", ":wincmd j<CR>", { noremap = true, silent = true })
map("n", "<leader>wk", ":wincmd k<CR>", { noremap = true, silent = true })
map("n", "<leader>wl", ":wincmd l<CR>", { noremap = true, silent = true })
map({ "n", "v" }, "G", "Gzz", { noremap = true, silent = true })
map("n", "<leader>pl", ":Lazy<CR>", { noremap = true, silent = true })
map("n", "<leader>da", "GVggd", { noremap = true, silent = true })
map({ "n", "v" }, "<leader>sa", "ggVG", { noremap = true, silent = true })
map("n", "yy", 'V"+y', { noremap = true, silent = true })
map("v", "y", '"+y', { noremap = true, silent = true })
map("n", "yiw", '"+yiw', { noremap = true, silent = true })
map("n", "Y", 'v$"+y', { noremap = true, silent = true })
map("n", "P", "Vp", { noremap = true, silent = true })
map("n", "<M-bs>", "diw", { noremap = true, silent = true })
map("n", "gcp", "vipgc", { noremap = true, silent = true })
map('n', '<leader>tw', ':set wrap!<CR>', { noremap = true, silent = true })

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

map('n', '<M-n>', '<cmd>cnext<CR>zz', { noremap = true, silent = true })
map('n', '<M-p>', '<cmd>cprev<CR>zz', { noremap = true, silent = true })
map('n', '<leader>qq', ToggleBQF, { noremap = true, silent = true })
map('n', '<leader>qn', '<cmd>cnewer<CR>', { noremap = true, silent = true })
map('n', '<leader>qp', '<cmd>colder<CR>', { noremap = true, silent = true })
