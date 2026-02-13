-- lua/plugins/formatting.lua
return {
  {
    "stevearc/conform.nvim",
    config = function ()
        vim.o.formatexpr = "v:lua.require('conform').formatexpr()"
    end
  },
}
