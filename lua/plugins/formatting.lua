-- lua/plugins/formatting.lua
return {
  {
    "stevearc/conform.nvim",
    opts = {
        format_on_save = {
            timeout_ms = 500,
        },
    },
    config = function ()
        vim.o.formatexpr = "v:lua.require('conform').formatexpr()"
    end
  },
}
