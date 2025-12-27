-- Global LSP configuration
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = true,
  severity_sort = true,
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    -- which-key labels (safe + optional)
    local ok, wk = pcall(require, "which-key")
    if ok then
      wk.add({
        { "<leader>l",  group = "+lsp" },
        { "<leader>ld", vim.lsp.buf.definition,     desc = "Go to defenition",     mode = "n" },
        { "<leader>lr", vim.lsp.buf.references,     desc = "Go to reference",      mode = "n" },
        { "<leader>li", vim.lsp.buf.implementation, desc = "Go to implementation", mode = "n" },

        { "<leader>ln", vim.lsp.buf.rename,         desc = "Rename symbol",        mode = "n" },
        { "<leader>la", vim.lsp.buf.code_action,    desc = "Code action",          mode = "n" },

        { "<leader>le", vim.diagnostic.open_float,  desc = "Diagnostics (float)",  mode = "n" },
        { "<leader>l[", vim.diagnostic.goto_prev,   desc = "Previous diagnostic",  mode = "n" },
        { "<leader>l]", vim.diagnostic.goto_next,   desc = "Next diagnostic",      mode = "n" },

        { "K",          vim.lsp.buf.hover,          desc = "Hover documentation",  mode = "n" },

      })
      local fmt_ok, fmt = pcall(require, "utils.format")
      if fmt_ok then
        wk.add({
          { "<leader>lf", fmt.format, desc = "Format", mode = "n" },
        })
      end
    end
  end,
})
