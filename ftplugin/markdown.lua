local lint = require("lint")
local conform = require("conform")
local treesitter = require("nvim-treesitter")

-- Setup markdown
vim.lsp.enable("marksman")
conform.formatters_by_ft.markdown = { "markdownlint" }
lint.linters_by_ft.markdown = { "markdownlint" }
