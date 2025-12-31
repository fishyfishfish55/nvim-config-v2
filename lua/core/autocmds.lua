local function augroup(name)
  return vim.api.nvim_create_augroup("user_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank({ timeout = 150 })
  end,
})

vim.api.nvim_create_autocmd("VimResized", {
  group = augroup("resize_splits"),
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

vim.api.nvim_create_autocmd("TermOpen", {
  group = augroup("terminal"),
  callback = function(event)
    vim.bo[event.buf].number = false
    vim.bo[event.buf].relativenumber = false
    vim.cmd("startinsert")
  end,
})

vim.api.nvim_create_autocmd("CursorHold", {
  group = augroup("diagnostic_float"),
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end,
})
