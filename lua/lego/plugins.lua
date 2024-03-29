local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- Package manager
  use {
    'williamboman/mason.nvim',           -- LSP installer
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',             -- Configurations for Nvim LSP
    run = ":MasonUpdate"
  }

  -- TODO: nvim-dap
  -- TODO: null-ls.nvim or nvim-lint
  -- TODO: formatter.nvim
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }
  use 'terrortylor/nvim-comment'
  use 'nvim-lualine/lualine.nvim'
  use {
        -- TODO: move config to separate file
    'nvim-tree/nvim-tree.lua',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require("nvim-tree").setup {
        view = {
          width = 50,
        },
        renderer = {
          icons = {
            show = {
              git = true,
              folder = true,
              file = true,
              folder_arrow = true,
            },
          },
        }
      }
    end
  }
  use 'lewis6991/gitsigns.nvim'
  use 'folke/which-key.nvim'
  use {
    'ThePrimeagen/harpoon',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
    },
  }
  use 'github/copilot.vim'
end)

