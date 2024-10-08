-- setup ➡️ init
-- requires ➡️ dependencies
-- as ➡️ name
-- opt ➡️ lazy
-- run ➡️ build
-- lock ➡️ pin
-- disable=true ➡️ enabled = false
-- tag='*' ➡️ version="*"
-- after is not needed for most use-cases. Use dependencies otherwise.
-- wants is not needed for most use-cases. Use dependencies otherwise.
-- config don't support string type, use fun(LazyPlugin) instead.
-- module is auto-loaded. No need to specify
-- keys spec is different
-- rtp can be accomplished with:

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        -- import/override with your plugins
        { import = "plugins" },
    },
    defaults = {
        -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
        -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
        lazy = false,
        -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
        -- have outdated releases, which may break your Neovim install.
        version = false, -- always use the latest git commit
    },
    install = { colorscheme = { "tokyonight" } },
    checker = { enabled = true }, -- automatically check for plugin updates
})
