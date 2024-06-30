require("mason").setup()
require("mason-lspconfig").setup({
    -- A list of servers to automatically install if they're not already installed. Example: { "rust_analyzer@nightly", "lua_ls" }
    -- This setting has no relation with the `automatic_installation` setting.
    ---@type string[]
    ensure_installed = {
        "pyright",
        "ruff",
        "lua_ls",
        "clangd",
    },

    -- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
    -- This setting has no relation with the `ensure_installed` setting.
    -- Can either be:
    --   - false: Servers are not automatically installed.
    --   - true: All servers set up via lspconfig are automatically installed.
    --   - { exclude: string[] }: All servers set up via lspconfig, except the ones provided in the list, are automatically installed.
    --       Example: automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
    ---@type boolean
    -- automatic_installation = true,

    -- See `:h mason-lspconfig.setup_handlers()`
    ---@type table<string, fun(server_name: string)>?
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
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
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
    sorting = {
        priority_weight = 2,
        comparators = {
            function(entry1, entry2)
                local kind1 = entry1:get_kind()
                local kind2 = entry2:get_kind()
                if kind1 == kind2 then
                    return nil
                end
                if kind1 == cmp.lsp.CompletionItemKind.Snippet then
                    return true
                end
                if kind2 == cmp.lsp.CompletionItemKind.Snippet then
                    return false
                end
                return nil
            end,
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            cmp.config.compare.recently_used,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
        },
    },
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' },
        { name = 'luasnip' },
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' },
        { name = 'luasnip' },
        { name = 'cmdline' },
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
})
