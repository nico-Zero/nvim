return{
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    config = function ()
        require('mason-tool-installer').setup {
            ensure_installed = {
                'bash-language-server',
                'vim-language-server',
                -- "mypy",
                "black",
                "lua_ls",
                "pyright",
                "clangd",
                "quick_lint_js",
                "rust_analyzer",
                "autopep8",
            },
            auto_update = false,
            run_on_start = true,
            integrations = {
            ['mason-lspconfig'] = true,
            ['mason-null-ls'] = true,
            ['mason-nvim-dap'] = true,
            },
        }
    end
}
