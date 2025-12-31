-- Global LSP configuration
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = true,
  severity_sort = true,
})

require("langs")

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    -- which-key labels (safe + optional)
    local ok, wk = pcall(require, "which-key")
    if ok then
      wk.add({
        { "<leader>l", group = "+lsp" },
        { "<leader>ld", vim.lsp.buf.definition, desc = "Go to definition" },
        { "<leader>lr", vim.lsp.buf.references, desc = "Go to reference" },
        { "<leader>li", vim.lsp.buf.implementation, desc = "Go to implementation" },

        { "<leader>ln", vim.lsp.buf.rename, desc = "Rename symbol" },
        { "<leader>la", vim.lsp.buf.code_action, desc = "Code action" },

        { "<leader>le", vim.diagnostic.open_float, desc = "Diagnostics (float)" },
        { "<leader>l[", vim.diagnostic.goto_prev, desc = "Previous diagnostic" },
        { "<leader>l]", vim.diagnostic.goto_next, desc = "Next diagnostic" },

        { "K", vim.lsp.buf.hover, desc = "Hover documentation" },
      }, {
        buffer = event.buf,
        mode = "n",
      })
      local fmt_ok, fmt = pcall(require, "utils.format")
      if fmt_ok then
        wk.add({
          { "<leader>lf", fmt.format, desc = "Format", mode = "n", buffer = event.buf },
        })
      end
    end

    -- Format on save (buffer-local)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = event.buf,
        callback = function()
          require("conform").format({ bufnr = event.buf })
        end,
      })
    end
  end,
})
