return {
  { "nvim-lualine/lualine.nvim" },
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
  {
    "alexghergh/nvim-tmux-navigation",
    require'nvim-tmux-navigation'.setup {
      keys = {
        { "<C-h>", "<cmd>NvimTmuxNavigateLeft<CR>", desc = "Navigate left" },
        { "<C-j>", "<cmd>NvimTmuxNavigateDown<CR>", desc = "Navigate down" },
        { "<C-k>", "<cmd>NvimTmuxNavigateUp<CR>", desc = "Navigate up" },
        { "<C-l>", "<cmd>NvimTmuxNavigateRight<CR>", desc = "Navigate right" },
      },
    } end
  },
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_foreground = 'original'
      vim.cmd.colorscheme('gruvbox-material')
    end
  },
}
