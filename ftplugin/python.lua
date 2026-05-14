local lint = require("lint")
local conform = require("conform")
local treesitter = require("nvim-treesitter")

-- Set up python
-- treesitter.install({ "python" })
vim.lsp.enable("basedpyright")
-- formatter preference order
conform.formatters_by_ft.python = {
  "isort",
  "black",
}
-- linter
lint.linters_by_ft.python = { "ruff" }
