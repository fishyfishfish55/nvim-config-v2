local lint = require("lint")
local conform = require("conform")
local treesitter = require("nvim-treesitter")

-- Setup rust
-- treesitter.install({ "rust" })
vim.lsp.enable("rust_analyzer")
conform.formatters_by_ft.rust = { "rustfmt" }
lint.linters_by_ft.rust = { "clippy" }
