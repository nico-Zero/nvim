return{
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    config = function ()
        require('mason-tool-installer').setup {
            ensure_installed = {
                -- "ruff_lsp",
                -- "pylsp",
                'bash-language-server',
                'vim-language-server',
                "mypy",
                "black",
                "lua_ls",
                "pyright",
                "clangd",
                "quick_lint_js",
                "rust_analyzer",
            },
            auto_update = true,
            run_on_start = true,
            integrations = {
            ['mason-lspconfig'] = true,
            ['mason-null-ls'] = true,
            ['mason-nvim-dap'] = true,
            },
        }
    end
}
