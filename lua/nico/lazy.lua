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
    -- 1.Teleschope
    {
        'nvim-telescope/telescope.nvim', version = '0.1.8',
        -- or                            , branch = '3.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    -- 2.Treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate",
    },

    -- 3.Nvim-Tree
    "nvim-tree/nvim-tree.lua",
    "nvim-tree/nvim-web-devicons",

    -- 4.Tokyo-Night-Theam
    {
        "folke/tokyonight.nvim",
    },

    -- 5.Auto-Close
    'm4xshen/autoclose.nvim',

    -- 6.LuaLine
    {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    },

    -- 7.Indent-Blankline
    "lukas-reineke/indent-blankline.nvim",

    -- 8.ToggleTerm
    "akinsho/toggleterm.nvim",

    -- 9.Code-Runner
    'CRAG666/code_runner.nvim',

    -- 10.Drassing
    "stevearc/dressing.nvim",

    -- 11.GitSigns
    "lewis6991/gitsigns.nvim",

    -- 12.Mason
    "williamboman/mason.nvim",
    {
        "williamboman/mason-lspconfig.nvim",
        lazy ={
            auto_install = true,
        }
    },
    "neovim/nvim-lspconfig",

    -- 13.Nvim-Cmp
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',

    -- 14.Vsnip
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',

    -- 15.Harpoon
    "ThePrimeagen/harpoon",

    -- 16.Comment
    {
        'numToStr/Comment.nvim',
    },

    -- 17.Scroll-bar
    "petertriho/nvim-scrollbar",

    -- 18.Surround
    "tpope/vim-surround",

    -- 19.Nvim-ts-AutoTag
    "windwp/nvim-ts-autotag",

    -- 20.Trouble
    {
        "folke/trouble.nvim",
        opts = {}, -- for default options, refer to the configuration section for custom setup.
        cmd = "Trouble",
    },
    -- 21.Multi-Line-Courser
    {
        "brenton-leighton/multiple-cursors.nvim",
        version = "*",  -- Use the latest tagged version
        opts = {},
    },

    -- 22.Nvim-Conda
    {
        "kmontocam/nvim-conda",
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    -- 23.HexEditor
    'RaafatTurki/hex.nvim',

    -- 24.MarkDownPreview
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },

    -- 25.NavBuddy
    {
        "SmiteshP/nvim-navbuddy",
        dependencies = {
            "SmiteshP/nvim-navic",
            "MunifTanjim/nui.nvim"
        },
        opts = { lsp = { auto_attach = true } }
    }
})
