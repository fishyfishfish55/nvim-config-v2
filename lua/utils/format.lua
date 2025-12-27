local M = {}

function M.format()
  vim.lsp.buf.format({ async = true })
end

return M
