-- Disable syntax highlighting
-- vim.cmd("syntax off")

-- Disable auto-indentation
vim.bo.autoindent = false
vim.bo.smartindent = false
vim.bo.expandtab = false
vim.bo.shiftwidth = 0
-- vim.bo.tabstop = 0

-- Disable file type plugins
vim.g.loaded_json = 1

-- Disable LSP for JSON files
-- vim.lsp.stop_client(vim.lsp.get_active_clients())
