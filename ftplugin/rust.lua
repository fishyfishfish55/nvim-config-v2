local conform = require("conform")
local treesitter = require("nvim-treesitter")

-- Setup rust
-- treesitter.install({ "rust" })
vim.lsp.config("rust_analyzer", {
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  root_markers = { "Cargo.toml", "rust-project.json" },
  settings = {
    ["rust-analyzer"] = {
      check = {
        command = "clippy",
        extraArg = { "-- --warn clippy::pedantic" },
      },
    },
  },
})

-- 2. Enable it for the current buffer/project
vim.lsp.enable("rust_analyzer")

conform.formatters_by_ft.rust = { "rustfmt" }
