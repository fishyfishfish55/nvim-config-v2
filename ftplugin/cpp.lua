local lint = require("lint")
local conform = require("conform")
local treesitter = require("nvim-treesitter")

-- Setup cpp
-- treesitter.install({ "cpp" })
vim.lsp.enable("clangd")
conform.formatters.clang_format = {
  append_args = function()
    return { "--style={BasedOnStyle: Google, IndentWidth: 4}" }
  end,
}
conform.formatters_by_ft.cpp = { "clang_format" }
