local lspconfig = require("lspconfig")

-- Rust
lspconfig.rust_analyzer.setup({
  settings = {
    ["rust-analyzer"] = {
      cargo = { allFeatures = true },
      checkOnSave = { command = "clippy" },
    },
  },
})

-- Python
lspconfig.pyright.setup({})

-- JavaScript / TypeScript
lspconfig.ts_ls.setup({
  filetypes = {"javascript", "typescript", "javascriptreact", "typescriptreact"},
})

