vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.o.wrap = false
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 15
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
-- vim.opt.colorcolumn = "80"
vim.g.mapleader = " "
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
-- vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='black' })
-- vim.api.nvim_set_hl(0, 'LineNr', { fg='yellow' })
-- vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='black' })
-- vim.opt.spelllang = 'en_us'
-- vim.opt.spell = true
vim.g.mkdp_auto_close = 0
vim.opt.showmode = false
vim.o.foldcolumn = "1" -- '0' is not bad
vim.g.lazydev_enabled = true
-- vim.opt.listchars:append "eol:↩"
vim.opt.splitright = true
vim.opt.splitbelow = true


-- ....................................
-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- Indent BlenkLine
vim.opt.list = true

vim.opt.cmdheight = 0

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics,
    { -- delay update diagnostics
        update_in_insert = true,
    })
