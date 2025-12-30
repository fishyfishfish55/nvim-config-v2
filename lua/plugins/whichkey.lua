return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.opt.timeout = true
		vim.opt.timeoutlen = 300
	end,
	opts = {
		spec = {
			{ "<leader>b", group = "buffers" },
			{ "<leader>f", group = "find" },
			{ "<leader>t", group = "terminal" },
			{ "<leader>w", group = "windows" },
		},
	},
	dependencies = {
		"nvim-mini/mini.icons",
		"nvim-tree/nvim-web-devicons",
	},
}
