return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      automatic_enable = false,
    },
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
  },
  {
    "nvimdev/lspsaga.nvim",
    opts = {
      LightBulb = { enable = false },
    },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },
}
