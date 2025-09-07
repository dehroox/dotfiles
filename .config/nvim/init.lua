vim.loader.enable()

vim.g.mapleader = " "

vim.pack.add({
    { src = "https://github.com/ellisonleao/gruvbox.nvim" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
    { src = "https://github.com/lewis6991/gitsigns.nvim" },
    { src = "https://github.com/echasnovski/mini.pick" },
    { src = "https://github.com/nvim-tree/nvim-web-devicons" },
    { src = "https://github.com/nvim-lualine/lualine.nvim" },
    { src = "https://github.com/windwp/nvim-autopairs" },
    { src = "https://github.com/rafamadriz/friendly-snippets" },
    { src = "https://github.com/mfussenegger/nvim-lint" },
    { src = "https://github.com/stevearc/conform.nvim" },
    { src = "https://github.com/akinsho/bufferline.nvim" },
    { src = "https://github.com/RedsXDD/neopywal.nvim" },
})

require("neopywal").setup({
    use_wallust = true,
    transparent_background = true,
})
vim.cmd.colorscheme("neopywal")

require("lualine").setup({ options = { globalstatus = true } })
require("gitsigns").setup()
require("mini.pick").setup()
require("nvim-autopairs").setup()

require("nvim-treesitter").setup({
    ensure_installed = { "lua", "c", "cpp" },
    highlight = { enable = true },
    incremental_selection = { enable = true },
    textobjects = { enable = true },
    modules = {},
    sync_install = true,
    auto_install = true,
    ignore_install = {},
})

require("lint").linters_by_ft = { lua = { "selene" }, c = { "clangtidy" }, cpp = { "clangtidy" } }
vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost" }, {
    callback = function()
        require("lint").try_lint()
    end,
})

require("conform").setup({
    formatters_by_ft = { lua = { "stylua" }, c = { "clang-format" }, cpp = { "clang-format" } },
    format_on_save = true,
})

require("bufferline").setup()

vim.opt.completeopt = { "menuone", "noinsert", "noselect" }
local capabilities = vim.lsp.protocol.make_client_capabilities()
vim.lsp.config("*", {
    capabilities = capabilities,
})
vim.lsp.enable({ "luals", "clangd" })

vim.diagnostic.config({
    virtual_text = {
        prefix = "●",
        spacing = 2,
        severity = { min = vim.diagnostic.severity.WARN },
    },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        border = "rounded",
        source = true,
        header = "",
        prefix = "",
    },
})

local signs = { Error = "✗", Warn = "⚠", Hint = "➤", Info = "ℹ" }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes:1"
vim.opt.wrap = false
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "•" }

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false
vim.opt.smartindent = true

vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.autoread = true
vim.opt.undofile = true
vim.opt.swapfile = false

local undodir = vim.fn.stdpath("state") .. "/undo"
vim.opt.undodir = undodir

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<Leader>w", "<cmd>w<CR>", opts)
map("n", "<Leader>q", "<cmd>q<CR>", opts)
map("n", "<Leader>W", "<cmd>wa<CR>", opts)
map("n", "<Leader>Q", "<cmd>qa<CR>", opts)

map("n", "<Leader>sv", "<C-w>v", opts)
map("n", "<Leader>sh", "<C-w>s", opts)
map("n", "<Leader>se", "<C-w>=", opts)
map("n", "<Leader>sx", "<C-w>c", opts)

map("n", "<Leader>bn", ":bnext<CR>", opts)
map("n", "<Leader>bb", ":bprevious<CR>", opts)
map("n", "<Leader>bd", ":bdelete<CR>", opts)

map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

map("n", "<space>e", function()
    vim.diagnostic.open_float(nil, { scope = "line" })
end, opts)

map("n", "K", vim.lsp.buf.hover, opts)
map("n", "gd", vim.lsp.buf.definition, opts)
map("n", "gr", vim.lsp.buf.references, opts)
map("n", "<leader>rn", vim.lsp.buf.rename, opts)
map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
map("n", "[d", function()
    vim.diagnostic.jump({ count = -1 })
end, opts)
map("n", "]d", function()
    vim.diagnostic.jump({ count = 1 })
end, opts)
map("n", "<leader>f", function()
    vim.lsp.buf.format({ async = true })
end, opts)

map("n", "<leader>ff", ":Pick files<CR>")

map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)

map("", "<Up>", "<Nop>")
map("", "<Down>", "<Nop>")
map("", "<Left>", "<Nop>")
map("", "<Right>", "<Nop>")

map({ "n", "v" }, "<Leader>y", [["+y]])
map("n", "<Leader>Y", [["+Y]])

map("n", "<C-Up>", ":resize -2<CR>")
map("n", "<C-Down>", ":resize +2<CR>")
map("n", "<C-Left>", ":vertical resize -2<CR>")
map("n", "<C-Right>", ":vertical resize +2<CR>")
