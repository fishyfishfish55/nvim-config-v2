local conform = require("conform")
local lint = require("lint")

-- Set up Lua
vim.lsp.enable("lua_ls")
vim.api.nvim_create_autocmd('FileType', {
	desc = 'Set up lua',
	pattern = 'lua',
	group = vim.api.nvim_create_augroup('lua_setup', { clear = true }),
	callback = function (opts)
		conform.formatters_by_ft.lua = { "stylua" }
		lint.linters_by_ft.lua = { "luacheck" }
	end,
})

-- Set up python
vim.lsp.enable("basedpyright")
vim.api.nvim_create_autocmd('FileType', {
	desc = 'Set up python',
	pattern = 'python',
	group = vim.api.nvim_create_augroup('python_setup', { clear = true }),
	callback = function (opts)
		-- formatter preference order
		conform.formatters_by_ft.python = {
			"isort",
			"black",
		}
		-- linter
		lint.linters_by_ft.python = { "ruff" }
	end,
})

-- Setup rust
vim.lsp.enable("rust_analyzer")
vim.api.nvim_create_autocmd('FileType', {
	desc = 'Set up rust',
	pattern = 'rust',
	group = vim.api.nvim_create_augroup('rust_setup', { clear = true }),
	callback = function (opts)
		conform.formatters_by_ft.rust = { "rustfmt" }
		lint.linters_by_ft.rust = { "clippy" }
	end,
})

-- require("langs.c")
vim.lsp.enable("clangd")
vim.api.nvim_create_autocmd('FileType', {
	desc = 'Set up c',
	pattern = 'c',
	group = vim.api.nvim_create_augroup('c_setup', { clear = true }),
	callback = function (opts)
		conform.formatters_by_ft.c = { "clang-format" }
	end,
})

