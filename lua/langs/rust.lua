-- lua/langs/rust.lua
local conform = require("conform")
local lint = require("lint")

vim.lsp.enable("rust_analyzer")
conform.formatters_by_ft.rust = { "rustfmt" }
lint.linters_by_ft.rust = { "clippy" }
