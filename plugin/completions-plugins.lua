vim.pack.add({ "https://github.com/rafamadriz/friendly-snippets" })

vim.api.nvim_create_autocmd("InsertEnter", {
  once = true,
  callback = function()
    vim.pack.add({
      { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("v1.x") },
    })
    require("blink.cmp").setup({
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
      keymap = {
        preset = "default",
      },
      completion = {
        documentation = { auto_show = true },
      },
      fuzzy = { implementation = "prefer_rust", prebuilt_binaries = { force_version = "v*" } },
    })
  end,
})
