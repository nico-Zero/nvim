return{
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/nvim-cmp',
        'saadparwaiz1/cmp_luasnip',
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        {
            "SmiteshP/nvim-navbuddy",
            dependencies = {
                "SmiteshP/nvim-navic",
                "MunifTanjim/nui.nvim"
            },
            opts = { lsp = { auto_attach = true } }
        },

        version = false,
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            handlers = {
                function (server_name)
                    require("lspconfig")[server_name].setup {
                    }
                end,
                ["lua_ls"] = function ()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim" }
                                }
                            }
                        }
                    }
                end,
                ["bashls"] = function ()
                    require("lspconfig").bashls.setup({
                        filetype = {"sh", "zsh" , "bash"}
                    })
                end,
                ["pyright"] = function ()
                    require("lspconfig").pyright.setup {
                        settings = {
                            python = {
                                analysis = {
                                    diagnosticMode = "workspace",
                                },
                            },
                        },
                        filetype= {"python"},
                    }
                end
            },
        })

        local cmp = require'cmp'
        local luasnip = require("luasnip")

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(8),
                ['<C-f>'] = cmp.mapping.scroll_docs(16),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                ['<S-Tab>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
                ['<Tab>'] = cmp.mapping.select_next_item({behavior = 'select'}),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip', option = { show_autosnippets = true }},
                { name = 'buffer' },
                { name = 'path' },
            }),
            -- sorting = {
            --     priority_weight = 2,
            --     comparators = {
            --         function(entry1, entry2)
            --             local kind1 = entry1:get_kind()
            --             local kind2 = entry2:get_kind()
            --             if kind1 == kind2 then
            --                 return nil
            --             end
            --             if kind1 == cmp.lsp.CompletionItemKind.Snippet then
            --                 return true
            --             end
            --             if kind2 == cmp.lsp.CompletionItemKind.Snippet then
            --                 return false
            --             end
            --             return nil
            --         end,
            --         cmp.config.compare.offset,
            --         cmp.config.compare.exact,
            --         cmp.config.compare.score,
            --         cmp.config.compare.recently_used,
            --         cmp.config.compare.kind,
            --         cmp.config.compare.sort_text,
            --         cmp.config.compare.length,
            --         cmp.config.compare.order,
            --     },
            -- },
        })

        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' },
                { name = 'luasnip' },
            }
        })

        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' },
                { name = 'luasnip' },
                { name = 'cmdline' },
            }),
        })
    end,
}
