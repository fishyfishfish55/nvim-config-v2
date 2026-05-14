local lint = require("lint")
local conform = require("conform")

conform.formatters_by_ft.lua = { "mbake" }
lint.linters_by_ft.make = { "mbake" }
