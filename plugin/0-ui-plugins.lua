require("vim._core.ui2").enable({ enable = true })

vim.pack.add({
  "https://github.com/nvim-lualine/lualine.nvim",
  "https://github.com/sainnhe/gruvbox-material",
  "https://github.com/lewis6991/gitsigns.nvim",
})

require("lualine").setup({
  options = { theme = "gruvbox" },
  sections = {
    lualine_a = {
      {
        "mode",
        fmt = function(str)
          return str:sub(1, 1)
        end,
      },
    },
    lualine_b = {},
    lualine_c = { { "filename", path = 1, symbols = { modified = "⭑" } } },
    lualine_x = { "filetype" },
    lualine_y = { "diagnostics" },
  },
})

vim.g.gruvbox_material_foreground = "original"
vim.cmd.colorscheme("gruvbox-material")

require("gitsigns").setup({
  word_diff = false,
  current_line_blame = true,
  current_line_blame_opts = {
    delay = 200,
  },
})

-- New difftool
vim.cmd.packadd("nvim.difftool")
