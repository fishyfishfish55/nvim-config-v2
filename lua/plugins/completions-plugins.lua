return {
  {
    "saghen/blink.cmp",
    event = "InsertEnter",
    version = "1.*",
    dependencies = {
      { "rafamadriz/friendly-snippets" },
    },
    opts = {
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
      keymap = {
        preset = "default",
      },
      completion = {
        documentation = { auto_show = true },
      },
      fuzzy = { implementation = "prefer_rust_with_warning" },
    },
  },
}
