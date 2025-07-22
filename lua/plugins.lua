-- Lazy yükle
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {"ellisonleao/gruvbox.nvim",
    priority = 1000, -- temalar için erken yüklenmesi önemli
    config = function()
        vim.cmd("colorscheme gruvbox")
    end,},
    {"williamboman/mason.nvim",opts={}},
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
    {"neovim/nvim-lspconfig"},
    {"hrsh7th/nvim-cmp"},
    {"hrsh7th/cmp-nvim-lsp"},
    {"L3MON4D3/LuaSnip"},
    {"nvim-lualine/lualine.nvim"},
    {"nvim-tree/nvim-tree.lua"},
    {"nvim-telescope/telescope.nvim"},
})

