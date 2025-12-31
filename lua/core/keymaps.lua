-- lua/core/keymaps.lua

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- ── Basic quality-of-life ─────────────────────────────────────
map("n", "<Esc>", "<cmd>nohlsearch<CR>", opts)
map("n", "<leader>p", '"*p', opts)
map("n", "<leader>y", '"*y', opts)

-- ── Window navigation ──────────────────────────────────────────
-- Moving between windows done with nvim-tmux-navigation in plugins.editor
map("n", "<leader>wv", "<cmd>vsplit<CR>", opts)
map("n", "<leader>wh", "<cmd>split<CR>", opts)
map("n", "<leader>wq", "<cmd>close<CR>", opts)

-- Resize splits
map("n", "<C-Up>", "<cmd>resize -2<CR>", opts)
map("n", "<C-Down>", "<cmd>resize +2<CR>", opts)
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", opts)
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", opts)

-- ── Buffer navigation ──────────────────────────────────────────
map("n", "<S-l>", "<cmd>bnext<CR>", opts)
map("n", "<S-h>", "<cmd>bprevious<CR>", opts)
map("n", "<leader>bb", "<cmd>Telescope buffers<CR>", opts)
map("n", "<leader>bd", "<cmd>bdelete<CR>", opts)

-- ── File / search (Telescope) ──────────────────────────────────
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opts)

-- ── Terminal ───────────────────────────────────────────────────
map("n", "<leader>t", "<cmd>terminal<CR>", opts)
map("t", "<Esc>", "<C-\\><C-n>", opts)
