-- Global LSP configuration
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = true,
  severity_sort = true,
})

local builtin = require("telescope.builtin")

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    -- which-key labels (safe + optional)
    local ok, wk = pcall(require, "which-key")
    if ok then
      wk.add({
        { "<leader>l", group = "+lsp" },
        { "<leader>ld", builtin.lsp_definitions, desc = "Go to definition" },
        { "<leader>lD", "<cmd>Lspsaga peek_definition<CR>", desc = "Peek definition" },
        { "<leader>lr", builtin.lsp_references, desc = "Go to reference" },
        { "<leader>li", builtin.lsp_implementations, desc = "Go to implementation" },

        { "<leader>ln", "<cmd>Lspsaga rename<CR>", desc = "Rename symbol" },
        { "<leader>la", "<cmd>Lspsaga code_action<CR>", desc = "Code action" },

        { "<leader>le", vim.diagnostic.open_float, desc = "Diagnostics (float)" },
        {
          "<leader>lf",
          function()
            require("conform").format({ bufnr = event.buf })
          end,
          desc = "Format",
        },
        {
          "<leader>l[",
          function()
            vim.diagnostic.jump({ count = -1, float = true })
          end,
          desc = "Previous diagnostic",
        },
        {
          "<leader>l]",
          function()
            vim.diagnostic.jump({ count = 1, float = true })
          end,
          desc = "Next diagnostic",
        },

        { "K", "<cmd>Lspsaga hover_doc<CR>", desc = "Hover documentation" },
      }, {
        buffer = event.buf,
        mode = "n",
      })
    end

    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      callback = function(args)
        require("conform").format({ bufnr = args.buf })
      end,
    })
  end,
})

require("langs")
