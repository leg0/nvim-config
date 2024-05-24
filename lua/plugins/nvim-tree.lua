local opts = function(desc, bufnr)
  return { desc = 'nvim-tree: ' .. desc, noremap = true, silent = true, nowait = true, buffer = bufnr }
end
local keymap = vim.api.nvim_set_keymap
local nvimtree_on_attach = function(bufnr)
  local t = require "nvim-tree"
  -- keymap("n", "<leader>ga", ":lua print 'bla'<cr>", opts('Add file to git', bufnr))
  vim.keymap.set("n", "<leader>ga", ":lua print 'bla'<cr>", opts("Add selected file to git", bufnr))
  -- vim.keymap.set("n", "<leader>gq", function() print 'git add' end, { buffer = bufnr })
  local api = require "nvim-tree.api"
  api.config.mappings.default_on_attach(bufnr)
end

return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    init = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
    end,
    config = function()
      require "nvim-tree".setup {
        on_attach = nvimtree_on_attach,
        hijack_cursor = true,
        view = {
            width = 50
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
      local api = require "nvim-tree.api"
      vim.keymap.set("n", "<leader>ee", api.tree.toggle,    opts 'Toggle file explorer')
      vim.keymap.set("n", "<leader>ef", api.tree.find_file, opts 'Find file in file explorer')
      vim.keymap.set("n", "<leader>qq", function()
        print(api.tree.get_node_under_cursor().name)
      end, opts "print node under cursor")
    end
}
