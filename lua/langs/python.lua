-- lua/langs/python.lua
local conform = require("conform")
local lint = require("lint")

-- formatter preference order
conform.formatters_by_ft.python = {
	"isort",
	"black",
}

-- linter
lint.linters_by_ft.python = { "ruff" }
