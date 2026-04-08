vim.pack.add({
  { src = "https://github.com/nvim-telescope/telescope.nvim", version = vim.version.range("v*") },
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/alexghergh/nvim-tmux-navigation",
  "https://github.com/folke/which-key.nvim",
  "https://github.com/nvim-mini/mini.icons",
  "https://github.com/nvim-tree/nvim-web-devicons",
})

require("which-key").setup({
  spec = {
    { "<leader>b", group = "buffers" },
    { "<leader>f", group = "find" },
    { "<leader>t", group = "terminal" },
    { "<leader>w", group = "windows" },
    { "<leader>h", group = "git" },
  },
})

require("telescope").setup()

vim.opt.timeout = true
vim.opt.timeoutlen = 300

local nvim_tmux_nav = require("nvim-tmux-navigation")
nvim_tmux_nav.setup({
  disable_when_zoomed = true, -- defaults to false
})

local map = vim.keymap.set

-- ── Basic quality-of-life ─────────────────────────────────────
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { noremap = true, silent = true })
map("n", "<leader>p", '"*p', { noremap = true, silent = true, desc = "paste from system clipboard" })
map("n", "<leader>y", '"*y', { noremap = true, silent = true, desc = "copy to system clipboard" })

vim.cmd.packadd("nvim.undotree")
map("n", "<leader>u", require("undotree").open, { noremap = true, silent = true, desc = "copy to system clipboard" })

map("n", "<leader>S", function()
  vim.pack.update()
end, { noremap = true, silent = true, desc = "Update packages" })

-- ── Window navigation ──────────────────────────────────────────
map("n", "<leader>wv", "<cmd>vsplit<CR>", { noremap = true, silent = true, desc = "Split window vertically" })
map("n", "<leader>wh", "<cmd>split<CR>", { noremap = true, silent = true, desc = "Split window horizontally" })
map("n", "<leader>wq", "<cmd>close<CR>", { noremap = true, silent = true, desc = "Close window" })
map("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
map("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
map("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
map("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
map("n", "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)

-- Resize splits
map("n", "<C-Up>", "<cmd>resize -2<CR>", { noremap = true, silent = true })
map("n", "<C-Down>", "<cmd>resize +2<CR>", { noremap = true, silent = true })
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { noremap = true, silent = true })
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { noremap = true, silent = true })

-- ── Buffer navigation ──────────────────────────────────────────
map("n", "<S-l>", "<cmd>bnext<CR>", { noremap = true, silent = true })
map("n", "<S-h>", "<cmd>bprevious<CR>", { noremap = true, silent = true })
map("n", "<leader>bb", "<cmd>Telescope buffers<CR>", { noremap = true, silent = true, desc = "Current buffers" })
map("n", "<leader>bd", "<cmd>bdelete<CR>", { noremap = true, silent = true, desc = "Close buffer" })

-- ── File / search (Telescope) ──────────────────────────────────
local telescope = require("telescope.builtin")

map("n", "<leader>ff", telescope.find_files, { noremap = true, silent = true, desc = "Find files" })
map("n", "<leader>fg", telescope.live_grep, { noremap = true, silent = true, desc = "Grep files" })
map("n", "<leader>fh", telescope.help_tags, { noremap = true, silent = true, desc = "Help tags" })

-- ── Terminal ───────────────────────────────────────────────────
map("n", "<leader>t", "<cmd>Lspsaga term_toggle<CR>", { noremap = true, silent = true, desc = "terminal" })

-- ── Git actions ───────────────────────────────────────────────────
local gitsigns = require("gitsigns")
map('n', '<leader>hs', gitsigns.stage_hunk, { noremap = true, silent = true, desc = "stage hunk" })
map('n', '<leader>hr', gitsigns.reset_hunk, { noremap = true, silent = true, desc = "reset hunk" })

map('v', '<leader>hs', function() gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end, { noremap = true, silent = true, desc = "stage hunk" })

map('v', '<leader>hr', function() gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end, { noremap = true, silent = true, desc = "reset hunk" })

map('n', '<leader>hS', gitsigns.stage_buffer, { noremap = true, silent = true, desc = "stage buffer" })
map('n', '<leader>hR', gitsigns.reset_buffer, { noremap = true, silent = true, desc = "stage buffer" })
map('n', '<leader>hp', gitsigns.preview_hunk, { noremap = true, silent = true, desc = "preview hunk" })
map('n', '<leader>hi', gitsigns.preview_hunk_inline, { noremap = true, silent = true, desc = "preview hunk (inline)" })

map('n', '<leader>hb', function() gitsigns.blame_line({ full = true }) end, { noremap = true, silent = true, desc = "line blame" })

map('n', '<leader>hd', gitsigns.diffthis, { noremap = true, silent = true, desc = "diff this" })

map('n', '<leader>hD', function() gitsigns.diffthis('~') end, { noremap = true, silent = true, desc = "diff this" })

map('n', '<leader>hQ', function() gitsigns.setqflist('all') end, { noremap = true, silent = true, desc = "See all hunks" })
map('n', '<leader>hq', gitsigns.setqflist, { noremap = true, silent = true, desc = "Add hunk to quickfix list" })

-- Text object
map({'o', 'x'}, 'ih', gitsigns.select_hunk, { noremap = true, silent = true, desc = "select hunk" })
