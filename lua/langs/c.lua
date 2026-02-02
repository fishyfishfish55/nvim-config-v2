-- lua/langs/c.lua
local conform = require("conform")

vim.lsp.enable("clangd")
conform.formatters_by_ft.lua = { "clang-format" }
