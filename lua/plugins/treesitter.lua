return {
  "nvim-treesitter/nvim-treesitter",
  event = "VeryLazy",
  init = function()
    -- vim.opt.runtimepath:append("~/.local/treesitter")
  end,
  config = function()
    require'nvim-treesitter.configs'.setup {
      parser_install_dir = "~/.local/share/nvim/lazy/nvim-treesitter",
      ensure_installed = { "cpp", "lua", },
      sync_install = false,
      auto_install = false,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
        -- disable = { TODO: disable for vim help }
      },
      indent = {
        enable = false,
      }
    }
    -- vim.opt.foldmethod = "expr"
    -- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
  end
}
