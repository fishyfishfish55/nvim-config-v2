vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == "nvim-treesitter" and kind == "update" then
      if not ev.data.active then
        vim.cmd.packadd("nvim-treesitter")
      end
      vim.cmd("TSUpdate")
    end
  end,
})

vim.pack.add({
  "https://github.com/mfussenegger/nvim-lint",
  "https://github.com/mason-org/mason-lspconfig.nvim",
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/nvimdev/lspsaga.nvim",
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/stevearc/conform.nvim",
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
})

local lint = require("lint")
vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
  callback = function()
    lint.try_lint()
  end,
})

local conform = require("conform")
conform.setup()

vim.o.formatexpr = "v:lua.require('conform').formatexpr()"

require("mason").setup()
require("mason-lspconfig").setup({ automatic_enable = false })

require("lspsaga").setup({ LightBulb = { enable = false } })
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
        { "grn", "<cmd>Lspsaga rename<CR>", desc = "Rename symbol" },
        { "gra", "<cmd>Lspsaga code_action<CR>", desc = "Code action" },
        { "gro", "<cmd>Lspsaga outline<CR>", desc = "Code outline" },
        {
          "<leader>lf",
          function()
            conform.format({ bufnr = event.buf })
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
        conform.format({ bufnr = args.buf })
      end,
    })
  end,
})
