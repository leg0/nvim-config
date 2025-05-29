return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  -- init = function()
  --   vim.opt.runtimepath:append("~/.local/treesitter")
  -- end,
  config = function()
    require'nvim-treesitter.configs'.setup {
      parser_install_dir = "~/.local/share/nvim/lazy/nvim-treesitter",
      ensure_installed = {
        "bash",
        "cmake",
        "cpp",
        "gitignore",
        "lua",
        "python",
        "rust",
        "typescript",
      },
      sync_install = false,
      auto_install = false,
      highlight = {
        enable = true,
        -- additional_vim_regex_highlighting = true,
        -- disable = { TODO: disable for vim help }
      },
      indent = {
        enable = false,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    }
    -- vim.opt.foldmethod = "expr"
    -- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
  end,
}
