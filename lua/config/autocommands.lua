local function augroup(name)
    return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    group = augroup("highlight_yank"),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- on hold open the diagnostic message
-- vim.api.nvim_create_autocmd("CursorHold", {
--     callback = function()
--         vim.diagnostic.open_float(nil, { focusable = false })
--     end,
-- })

-- -- Function to check for overflow or multiple diagnostics
-- local function open_diagnostics_float()
--     local line = vim.api.nvim_get_current_line()
--     local diagnostics = vim.diagnostic.get(0) -- Get diagnostics for current buffer
--     local current_line_diagnostics = vim.diagnostic.get(0, { lnum = vim.fn.line('.') - 1 })
--
--     -- Check if virtual text might overflow or if there are multiple diagnostics on the current line
--     if #current_line_diagnostics > 1 or (#line > vim.o.columns - 5) then
--         vim.diagnostic.open_float(nil, { focusable = false }) -- Open the floating window
--     end
-- end
--
-- -- Autocmd to trigger on CursorHold
-- vim.api.nvim_create_autocmd("CursorHold", {
--     callback = open_diagnostics_float,
-- })

-- vim.o.updatetime = 500
-- vim.cmd [[autocmd CursorHold * lua vim.diagnostic.open_float(nil, {focus=false})]]
