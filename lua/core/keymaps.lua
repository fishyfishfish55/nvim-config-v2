-- lua/core/keymaps.lua

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local map = vim.keymap.set

-- ── Basic quality-of-life ─────────────────────────────────────
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { noremap = true, silent = true })
map("n", "<leader>p", '"*p', { noremap = true, silent = true, desc = "paste from system clipboard" })
map("n", "<leader>y", '"*y', { noremap = true, silent = true, desc = "copy to system clipboard" })

-- ── Window navigation ──────────────────────────────────────────
-- Moving between windows done with nvim-tmux-navigation in plugins.editor
map("n", "<leader>wv", "<cmd>vsplit<CR>", { noremap = true, silent = true, desc = "Split window vertically" })
map("n", "<leader>wh", "<cmd>split<CR>", { noremap = true, silent = true, desc = "Split window horizontally" })
map("n", "<leader>wq", "<cmd>close<CR>", { noremap = true, silent = true, desc = "Close window" })

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
local builtin = require("telescope.builtin")

map("n", "<leader>ff", builtin.find_files, { noremap = true, silent = true, desc = "Find files" })
map("n", "<leader>fg", builtin.live_grep, { noremap = true, silent = true, desc = "Grep files" })
map("n", "<leader>fh", builtin.help_tags, { noremap = true, silent = true, desc = "Help tags" })

-- ── Terminal ───────────────────────────────────────────────────
map("n", "<leader>t", "<cmd>Lspsaga term_toggle<CR>", { noremap = true, silent = true, desc = "terminal" })
