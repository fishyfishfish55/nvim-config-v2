vim.pack.add({
  "https://github.com/mfussenegger/nvim-lint",
  "https://github.com/mason-org/mason-lspconfig.nvim",
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/nvimdev/lspsaga.nvim",
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/stevearc/conform.nvim",
})

vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
  callback = function()
    require("lint").try_lint()
  end,
})

require("conform").setup()

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

local conform = require("conform")
local lint = require("lint")

-- Set up Lua
vim.lsp.config("lua_ls", {
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if
        path ~= vim.fn.stdpath("config")
        and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
      then
        return
      end
    end

    client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
      runtime = {
        -- Tell the language server which version of Lua you're using (most
        -- likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
        -- Tell the language server how to find Lua modules same way as Neovim
        -- (see `:h lua-module-load`)
        path = {
          "lua/?.lua",
          "lua/?/init.lua",
        },
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
          -- Depending on the usage, you might want to add additional paths
          -- here.
          -- '${3rd}/luv/library',
          -- '${3rd}/busted/library',
        },
        -- Or pull in all of 'runtimepath'.
        -- NOTE: this is a lot slower and will cause issues when working on
        -- your own configuration.
        -- See https://github.com/neovim/nvim-lspconfig/issues/3189
        -- library = vim.api.nvim_get_runtime_file('', true),
      },
    })
  end,
  settings = {
    Lua = {},
  },
})
vim.lsp.enable("lua_ls")
vim.api.nvim_create_autocmd("FileType", {
  desc = "Set up lua",
  pattern = "lua",
  group = vim.api.nvim_create_augroup("lua_setup", { clear = true }),
  callback = function(opts)
    conform.formatters_by_ft.lua = { "stylua" }
    lint.linters_by_ft.lua = { "luacheck" }
  end,
})

-- Set up python
vim.lsp.enable("basedpyright")
vim.api.nvim_create_autocmd("FileType", {
  desc = "Set up python",
  pattern = "python",
  group = vim.api.nvim_create_augroup("python_setup", { clear = true }),
  callback = function(opts)
    -- formatter preference order
    conform.formatters_by_ft.python = {
      "isort",
      "black",
    }
    -- linter
    lint.linters_by_ft.python = { "ruff" }
  end,
})

-- Setup rust
vim.lsp.enable("rust_analyzer")
vim.api.nvim_create_autocmd("FileType", {
  desc = "Set up rust",
  pattern = "rust",
  group = vim.api.nvim_create_augroup("rust_setup", { clear = true }),
  callback = function(opts)
    conform.formatters_by_ft.rust = { "rustfmt" }
    lint.linters_by_ft.rust = { "clippy" }
  end,
})

-- Setup c
vim.lsp.enable("clangd")
vim.api.nvim_create_autocmd("FileType", {
  desc = "Set up c",
  pattern = "c",
  group = vim.api.nvim_create_augroup("c_setup", { clear = true }),
  callback = function(opts)
    conform.formatters_by_ft.c = { "clang_format" }
  end,
})

-- Setup cpp
vim.api.nvim_create_autocmd("FileType", {
  desc = "Set up cpp",
  pattern = "cpp",
  group = vim.api.nvim_create_augroup("cpp_setup", { clear = true }),
  callback = function(opts)
    conform.formatters.clang_format = {
      append_args = function()
        return { "--style={BasedOnStyle: Google, IndentWidth: 4}" }
      end,
    }
    conform.formatters_by_ft.cpp = { "clang_format" }
  end,
})
