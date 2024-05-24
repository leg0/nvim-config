return {
  "nvim-lualine/lualine.nvim",
  config = function()
    vim.o.showmode = false
    require "lualine".setup {
      options = {
        globalstatus = true,
      }
    }
  end
}
