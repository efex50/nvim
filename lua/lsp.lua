local lspconfig = require("lspconfig")

-- Rust
lspconfig.rust_analyzer.setup({
  settings = {
    ["rust-analyzer"] = {
      cargo = { allFeatures = true },
      checkOnSave = true,
    },
  },
})

-- Python
lspconfig.pyright.setup({})

-- JavaScript / TypeScript
lspconfig.ts_ls.setup({
  filetypes = {"javascript", "typescript", "javascriptreact", "typescriptreact"},
})


-- Lua
lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      runtime = {
        -- Neovim LuaJIT kullanır
        version = 'LuaJIT',
      },
      diagnostics = {
        -- `vim` global'ını tanı (yoksa uyarı verir)
        globals = { 'vim' },
      },
      workspace = {
        -- Neovim runtime'ını LSP'ye tanıt
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = {
        enable = false, -- Microsoft’a veri göndermesin
      },
    },
  },
})


lspconfig.clangd.setup {
    cmd = { "clangd" },
    filetypes = { "c", "cpp", "objc", "objcpp" },
    root_dir = lspconfig.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
}

