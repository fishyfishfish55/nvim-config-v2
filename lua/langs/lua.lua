-- lua/langs/lua.lua
local conform = require("conform")
local lint = require("lint")

conform.formatters_by_ft.lua = { "stylua" }
lint.linters_by_ft.lua = { "luacheck" }
