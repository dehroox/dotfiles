-- Leader
vim.g.mapleader = " "

-- UI
vim.opt.termguicolors   = true
vim.opt.number          = true
vim.opt.relativenumber  = true
vim.opt.cursorline      = true
vim.opt.signcolumn      = "yes:1"
vim.opt.numberwidth     = 2
vim.opt.list            = true
vim.opt.listchars       = { tab = "» ", trail = "•" }
vim.opt.wrap            = false
vim.opt.linebreak       = true
vim.opt.laststatus      = 3

-- Indentation
vim.opt.tabstop     = 4
vim.opt.shiftwidth  = 4
vim.opt.expandtab   = true
vim.opt.smartindent = true

-- Search
vim.opt.hlsearch   = true
vim.opt.ignorecase = true
vim.opt.smartcase  = true
vim.opt.incsearch  = true

-- Behavior
vim.opt.scrolloff     = 8
vim.opt.sidescrolloff = 8
vim.opt.updatetime    = 300
vim.opt.timeoutlen    = 600
vim.opt.ttimeoutlen   = 10
vim.opt.pumheight     = 10
vim.opt.autowrite     = true
vim.opt.autoread      = true
vim.opt.undofile      = true
vim.opt.wildoptions   = "pum"

-- Undo dir
local undodir = vim.fn.stdpath("state") .. "/undo"
vim.opt.undodir = undodir

-- Lua loader
vim.loader.enable()

-- lazy.nvim bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none", "--depth=1",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Plugins
require("lazy").setup({

    -- Colorscheme
    {
        "rebelot/kanagawa.nvim",
        lazy = false,
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
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("telescope").setup({
                pickers = {
                    find_files = { theme = "dropdown" },
                },
            })
        end,
    },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
            ensure_installed = { "lua", "c", "cpp" },
        },
    },

    -- Autopairs
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
    },

    -- Autocomplete (Coq)
    {
        "ms-jpq/coq_nvim",
        branch = "coq",
        dependencies = {
            "ms-jpq/coq.artifacts",
            "ms-jpq/coq.thirdparty"
        },
        config = function()
            vim.opt.completeopt = { "menuone", "noselect" }

            vim.g.coq_settings = {
                auto_start = 'shut-up'
            }

            require("coq")
        end,
    },
})

-- LSP
local lsp_capabilities = vim.lsp.protocol.make_client_capabilities()
lsp_capabilities =  require("coq").lsp_ensure_capabilities(lsp_capabilities)

vim.lsp.config("*", {
    capabilities = lsp_capabilities,
})

vim.lsp.enable({
    "luals",
    "clangd"
})

-- Keymaps
local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<Leader>w", "<cmd>w<CR>", opts)
vim.keymap.set("n", "<Leader>q", "<cmd>q<CR>", opts)

vim.keymap.set("n", "<Leader>sv", "<C-w>v", opts)  -- vertical split
vim.keymap.set("n", "<Leader>sh", "<C-w>s", opts)  -- horizontal split
vim.keymap.set("n", "<Leader>se", "<C-w>=", opts)  -- equalize splits
vim.keymap.set("n", "<Leader>sx", "<C-w>c", opts)  -- close split

vim.keymap.set("n", "<Leader>bn", ":bnext<CR>", opts)
vim.keymap.set("n", "<Leader>bp", ":bprevious<CR>", opts)
vim.keymap.set("n", "<Leader>bd", ":bdelete<CR>", opts)

vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

vim.keymap.set("n", "<Leader>ff", function() require("telescope.builtin").find_files() end, opts)
vim.keymap.set("n", "<Leader>fg", function() require("telescope.builtin").live_grep() end, opts)
vim.keymap.set("n", "<Leader>fb", function() require("telescope.builtin").buffers() end, opts)
vim.keymap.set("n", "<Leader>fh", function() require("telescope.builtin").help_tags() end, opts)

