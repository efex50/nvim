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
{
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-file-browser.nvim',
  },
  config = function()
    require('telescope').setup {
    defaults = {
        sorting_strategy = "ascending",
        layout_config = {
            prompt_position = "top" 
        }
    },  
    extensions = {
        file_browser = {
            hijack_netrw = true,
            hidden = true,
            grouped = true,       -- groups files/folders like netrw
            respect_gitignore = false,
            add_dirs = true,      -- allows `..` style directory entries
            dir_icon = "",
            -- You can define custom keymaps here
        }
      }
    }

    require('telescope').load_extension 'file_browser'
  end
}

})


