-- lua/langs/lua.lua
local conform = require("conform")
local lint = require("lint")

vim.lsp.enable("lua_ls")
conform.formatters_by_ft.lua = { "stylua" }
lint.linters_by_ft.lua = { "luacheck" }
