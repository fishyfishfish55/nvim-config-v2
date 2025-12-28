return {
  {
    "saghen/blink.cmp",
    event = "InsertEnter",
    version = "1.*",
    dependencies = {
      { "rafamadriz/friendly-snippets" }
    },
    opts = {
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
      keymap = {
        preset = "super-tab",
      },
      completion = {
        documentation = { auto_show = true },
      },
    },
  },
}
