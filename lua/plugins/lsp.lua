return {
    {
        "neovim/nvim-lspconfig",
        event = "VeryLazy",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/nvim-cmp",
            "saadparwaiz1/cmp_luasnip",
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            {
                "SmiteshP/nvim-navbuddy",
                dependencies = {
                    "SmiteshP/nvim-navic",
                    "MunifTanjim/nui.nvim",
                },
                opts = { lsp = { auto_attach = true } },
                config = function()
                    require("nvim-navbuddy").setup()
                    vim.keymap.set("n", "<leader>sf", "<cmd>Navbuddy<CR>", { noremap = true, silent = true })
                end,
            },
            version = false,
        },
        config = function()
            require("mason").setup()
            vim.keymap.set("n", "<leader>pm", ":Mason<CR>", { noremap = true, silent = true })
            local navbuddy = require("nvim-navbuddy")
            require("mason-lspconfig").setup({
                handlers = {
                    function(server_name)
                        require("lspconfig")[server_name].setup({
                            on_attach = function(client, bufnr)
                                navbuddy.attach(client, bufnr)
                            end,
                        })
                    end,
                    ["lua_ls"] = function()
                        local lspconfig = require("lspconfig")
                        lspconfig.lua_ls.setup({
                            settings = {
                                Lua = {
                                    diagnostics = {
                                        globals = { "vim" },
                                    },
                                },
                            },
                            on_attach = function(client, bufnr)
                                navbuddy.attach(client, bufnr)
                            end,
                        })
                    end,
                    ["bashls"] = function()
                        require("lspconfig").bashls.setup({
                            filetype = { "sh", "zsh", "bash" },
                            on_attach = function(client, bufnr)
                                navbuddy.attach(client, bufnr)
                            end,
                        })
                    end,
                    ["pyright"] = function()
                        require("lspconfig").pyright.setup({
                            settings = {
                                python = {
                                    analysis = {
                                        diagnosticMode = "workspace",
                                    },
                                },
                            },
                            filetypes = { "python" },
                            on_attach = function(client, bufnr)
                                navbuddy.attach(client, bufnr)
                            end,
                        })
                    end,
                    ["rust_analyzer"] = function()
                        local lspconfig = require("lspconfig")
                        local util = require("lspconfig/util")

                        lspconfig.rust_analyzer.setup({
                            on_attach = function(client, bufnr)
                                navbuddy.attach(client, bufnr)
                            end,
                            filetypes = { "rust" },
                            root_dir = util.root_pattern("Cargo.toml"),
                            settings = {
                                ["rust-analyzer"] = {
                                    cargo = {
                                        allFeatures = true,
                                    },
                                },
                            },
                        })
                    end,
                },
            })

            local cmp = require("cmp")
            local luasnip = require("luasnip")
            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                sorting = {
                    priority_weight = 1,
                    comparators = {
                        -- Below is the snippet comparator
                        function(entry1, entry2)
                            local kind1 = entry1:get_kind()
                            local kind2 = entry2:get_kind()

                            -- 15 corresponds to snippets in LSP
                            if kind1 == 15 and kind2 ~= 15 then
                                return false
                            elseif kind2 == 15 and kind1 ~= 15 then
                                return true
                            end
                        end,

                        cmp.config.compare.offset, -- Compares items based on their position relative to the cursor. Items closer to the cursor are prioritized.
                        cmp.config.compare.exact,  -- Prioritizes items that exactly match the input text. This means if you type foo, a completion item fooBar would be less preferred than foo.
                        cmp.config.compare.score,  -- Uses an internal scoring system to determine which items should appear first based on how well they match the context.

                        -- Below comparator can handle auto-import sorting
                        function(entry1, entry2)
                            local source1 = entry1.source.name
                            local source2 = entry2.source.name

                            if source1 == 'nvim_lsp' and source2 ~= 'nvim_lsp' then
                                return true
                            elseif source2 == 'nvim_lsp' and source1 ~= 'nvim_lsp' then
                                return false
                            end
                        end,

                        cmp.config.compare.kind,      -- Sorts items based on their kind (e.g., function, variable, class). This is useful if you want to group similar types together.
                        cmp.config.compare.sort_text, -- Sorts items based on the sortText field of the completion item. This can be customized in the LSP server response.
                        cmp.config.compare.length,    -- Gives preference to shorter items over longer ones. This can help in reducing clutter and prioritizing concise matches.
                        cmp.config.compare.order,     -- Sorts based on the order in which items were provided by the completion source. Items that are presented earlier are given higher priority.
                    },
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(8),
                    ["<C-f>"] = cmp.mapping.scroll_docs(16),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                    ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
                    ["<Tab>"] = cmp.mapping.select_next_item({ behavior = "select" }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp", priority_weight = 1 },
                    { name = "luasnip",  option = { show_autosnippets = true }, priority_weight = 2 },
                    { name = "buffer",   priority_weight = 3 },
                    { name = "path",     priority_weight = 4 },
                }),
            })

            cmp.setup.cmdline({ "/", "?" }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = "buffer" },
                    { name = "luasnip" },
                },
            })

            cmp.setup.cmdline(":", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = "path" },
                    { name = "luasnip" },
                    { name = "cmdline" },
                }),
            })
        end,
    },
    {
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        config = function()
            require("lsp_lines").setup()

            vim.diagnostic.config({
                virtual_text = false,
                signs = false,
                underline = false,
            })
        end
    },
}
