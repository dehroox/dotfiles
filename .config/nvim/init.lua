-- Leader
vim.g.mapleader = " "

-- UI
vim.opt.termguicolors   = true
vim.opt.number          = true
vim.opt.relativenumber  = true
vim.opt.cursorline      = true
vim.opt.signcolumn      = "yes"
vim.opt.numberwidth     = 2
vim.opt.list            = true
vim.opt.listchars       = { tab = "» ", trail = "•" }
vim.opt.wrap            = false
vim.opt.linebreak       = true
vim.opt.cmdheight       = 0
vim.opt.laststatus      = 3
vim.opt.showcmd         = false

-- Indentation
vim.opt.tabstop     = 4
vim.opt.shiftwidth  = 0   -- uses tabstop if 0
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
vim.opt.updatetime    = 200
vim.opt.timeoutlen    = 500
vim.opt.ttimeoutlen   = 10
vim.opt.pumheight     = 10
vim.opt.autowrite     = true
vim.opt.autoread      = true
vim.opt.undofile      = true
vim.opt.wildoptions   = "pum"

-- Undo dir
local undodir = vim.fn.stdpath("state") .. "/undo"
vim.opt.undodir = undodir

-- Keymaps
vim.keymap.set("n", "<Leader>w", "<cmd>w<cr>", { silent = true })
vim.keymap.set("n", "<Leader>q", "<cmd>q<cr>", { silent = true })

-- Lua loader
vim.loader.enable()

-- lazy.nvim bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
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
        keys = {
            { "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Find files" },
            { "<leader>fg", function() require("telescope.builtin").live_grep()  end, desc = "Live grep"  },
            { "<leader>fb", function() require("telescope.builtin").buffers()    end, desc = "Buffers"    },
            { "<leader>fh", function() require("telescope.builtin").help_tags()  end, desc = "Help tags"  },
        },
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
            highlight = {
                enable = true,
                disable = function(_, buf)
                    local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
                    return ok and stats and stats.size > 200 * 1024
                end,
            },
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
        event = "BufReadPre",
        dependencies = {
            "ms-jpq/coq.artifacts",
            "ms-jpq/coq.thirdparty"
        },
        config = function()
            vim.g.coq_settings = { auto_start = true, }

            vim.cmd{ cmd = "COQnow", args = {"-s"} }
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
