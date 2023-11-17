local function my_on_attach(bufnr)
  local api = require('nvim-tree.api')


  api.config.mappings.default_on_attach(bufnr)

  -- your removals and mappings go here
    -- vim.api.nvim_create_autocmd(
    --   { 'BufEnter' },
    --   { pattern = '*',
    --     callback = function()
    --       vim.cmd('NvimTreeFindFile')
    --     end
    --   })

end

require('nvim-tree').setup {
  on_attach = my_on_attach,

}

local opts = function(desc)
  return { desc = 'nvim-tree: ' .. desc, noremap = true, silent = true, nowait = true }
end
local keymap = vim.api.nvim_set_keymap
keymap("n", "<leader>ee", ":NvimTreeOpen<cr>",     opts 'Open file explorer')
keymap("n", "<leader>ec", ":NvimTreeClose<cr>",    opts 'Close file explorer')
keymap("n", "<leader>ef", ":NvimTreeFindFile<cr>", opts 'Find file in file explorer')

-- local M = {}
-- function M.setup()
--     print("Loading nvimtree.lua")
--     local tree = require('nvim-tree')
--     tree.setup({
--         view = {
--             width = 50,
--         },
--         renderer = {
--             special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md", "CMakeLists.txt" },
--         },
--     })
-- end
-- return M
--
-- require "nvim-tree".setup {
--     view = {
--         width = 50,
--     },
--     renderer = {
--         special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md", "CMakeLists.txt" },
--     },
-- }

-- File explorer
-- TODO move to nvim-tree.lua

