-- lua/langs/lua.lua
local lsp = require("lspconfig")
local conform = require("conform")
local lint = require("lint")

-- lsp.lua_ls.setup({
--   settings = {
--     Lua = {
--       diagnostics = { globals = { "vim" } },
--       workspace = { checkThirdParty = false },
--     },
--   },
-- })

conform.formatters_by_ft.lua = { "stylua" }
lint.linters_by_ft.lua = { "luacheck" }

