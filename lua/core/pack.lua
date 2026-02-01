-- Install packages
local gh = function(s)
  return "https://github.com/" .. s
end

vim.keymap.set(
  "n",
  "<leader>S",
  vim.pack.update(),
  { noremap = true, silent = true, desc = "copy to system clipboard" }
)

vim.pack.add({ gh("nvim-telescope/telescope.nvim") })
