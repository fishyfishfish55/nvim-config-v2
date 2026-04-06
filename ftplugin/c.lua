local lint = require("lint")
local conform = require("conform")
local treesitter = require("nvim-treesitter")

-- Setup c
treesitter.install({ "c" })
vim.lsp.enable("clangd")
conform.formatters_by_ft.c = { "clang_format" }
