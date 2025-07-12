local cmp = require("cmp")

cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    -- { name = "path" }, { name = "buffer" } gibi ek kaynaklar da olur
  },
})


local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<Space>", "", opts)
vim.g.mapleader = " "

map("n", "<leader>w", ":w<CR>", opts)
map("n", "<leader>q", ":q<CR>", opts)


-- terminal aç
map('n', '<leader>t', ':split term://$SHELL<CR>', { noremap = true, silent = true })
-- terminal modundan çık
map('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })
