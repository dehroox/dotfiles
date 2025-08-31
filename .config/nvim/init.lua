-- Leader
vim.g.mapleader = " "

-- UI
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes:1"
vim.opt.numberwidth = 2
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "•" }
vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.laststatus = 3

-- Indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Search
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true

-- Behavior
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.lazyredraw = true
vim.opt.mouse = "a"
vim.opt.updatetime = 200
vim.opt.timeoutlen = 500
vim.opt.ttimeoutlen = 20
vim.opt.pumheight = 10
vim.opt.autowrite = true
vim.opt.autoread = true
vim.opt.undofile = true
vim.opt.wildoptions = "pum"
vim.opt.pumblend = 10

-- Undo dir
local undodir = vim.fn.stdpath("state") .. "/undo"
vim.opt.undodir = undodir

-- Lua loader
vim.loader.enable()

-- lazy.nvim bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Misc opt
vim.opt.completeopt = { "menuone", "noinsert", "noselect" }

-- Plugins
require("lazy").setup({

    -- Colorscheme
    {
        "rebelot/kanagawa.nvim",
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("kanagawa")
        end,
    },

    -- Statusline
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup({
                options = {
                    theme = "kanagawa",
                    globalstatus = true,
                },
            })
        end,
    },

    -- Git signs
    {
        "lewis6991/gitsigns.nvim",
        event = "BufReadPre",
        config = true,
    },

    -- Telescope
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
        config = function()
            require("telescope").setup({
                pickers = {
                    find_files = { theme = "dropdown" },
                },
                defaults = {
                    file_ignore_patterns = { "node_modules", ".git" },
                    prompt_prefix = "🔍 ",
                },
                extensions = {
                    fzf = {},
                },
            })

            require("telescope").load_extension("fzf")
        end,
    },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
            ensure_installed = { "lua", "c", "cpp" },
            highlight = { enable = true },
            incremental_selection = { enable = true },
            textobjects = { enable = true },
        },
    },

    -- Autopairs
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
    },

    -- Autocomplete
    {
        "saghen/blink.cmp",
        dependencies = { "rafamadriz/friendly-snippets" },
        version = "*",

        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            keymap = { preset = "default" },

            appearance = {
                nerd_font_variant = "mono",
            },

            completion = {
                ghost_text = {
                    enabled = true,
                },
                documentation = { auto_show = true, auto_show_delay_ms = 200 },
            },

            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
            },

            fuzzy = { implementation = "prefer_rust_with_warning" },
        },
        opts_extend = { "sources.default" },
    },

    -- Linting/Formatting
    {
        "mfussenegger/nvim-lint",
        event = "BufReadPost",
        config = function()
            require("lint").linters_by_ft = {
                lua = { "selene" },
                c = { "clangtidy" },
                cpp = { "clangtidy" },
            }

            vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost" }, {
                callback = function()
                    require("lint").try_lint()
                end,
            })
        end,
    },
    {
        "stevearc/conform.nvim",
        event = "BufWritePre",
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    lua = { "stylua" },
                    c = { "clang-format" },
                    cpp = { "clang-format" },
                },
                format_on_save = true,
            })
        end,
    },

    -- Bufferline
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = "nvim-tree/nvim-web-devicons",
        event = "BufReadPost",
        config = function()
            require("bufferline").setup({
                options = {},
            })
        end,
    },

    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {},
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
            },
        },
    },
})

-- LSP
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

vim.lsp.config("*", {
    capabilities = capabilities,
})

vim.lsp.enable({
    "luals",
    "clangd",
})

-- Keymaps
local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<Leader>w", "<cmd>w<CR>", opts)
vim.keymap.set("n", "<Leader>q", "<cmd>q<CR>", opts)
vim.keymap.set("n", "<Leader>W", "<cmd>wa<CR>", opts)
vim.keymap.set("n", "<Leader>q", "<cmd>qa<CR>", opts)

vim.keymap.set("n", "<Leader>sv", "<C-w>v", opts) -- vertical split
vim.keymap.set("n", "<Leader>sh", "<C-w>s", opts) -- horizontal split
vim.keymap.set("n", "<Leader>se", "<C-w>=", opts) -- equalize splits
vim.keymap.set("n", "<Leader>sx", "<C-w>c", opts) -- close split

vim.keymap.set("n", "<Tab>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", opts)
vim.keymap.set("n", "<Tab>d", ":bdelete<CR>", opts)

vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

vim.keymap.set("n", "<space>e", function()
    vim.diagnostic.open_float(nil, { scope = "line" })
end, opts)

vim.keymap.set("n", "<Leader>ff", function()
    require("telescope.builtin").find_files()
end, opts)
vim.keymap.set("n", "<Leader>fg", function()
    require("telescope.builtin").live_grep()
end, opts)
vim.keymap.set("n", "<Leader>fb", function()
    require("telescope.builtin").buffers()
end, opts)
vim.keymap.set("n", "<Leader>fh", function()
    require("telescope.builtin").help_tags()
end, opts)
