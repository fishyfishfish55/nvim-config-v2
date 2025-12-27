return {
  {
    "saghen/blink.cmp",
    event = "InsertEnter",
    version = "1.*",
    opts = {
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
    },
    keymap = {
      preset = "default",
    },
  },
}
