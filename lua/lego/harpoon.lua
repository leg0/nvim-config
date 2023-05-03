require("telescope").load_extension("harpoon")

local harpoon = require("harpoon")
harpoon.setup { }

local function keymap(mode, key, cmd, opts)
  if not opts then
    opts = {}
  end
  if opts.desc then
    opts.desc = "Harpoon: " .. opts.desc
  end
  vim.api.nvim_set_keymap(mode, key, cmd, opts)
end

keymap("n", "<C-k>k", "<cmd>lua require('harpoon.mark').add_file()<CR>", { desc = "Add mark" })
keymap("n", "<C-k>u", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", { desc = "Toggle UI" })
keymap("n", "<C-k>n", "<cmd>lua require('harpoon.ui').nav_next()<CR>", { desc = "Navigate to next mark" })
keymap("n", "<C-k>p", "<cmd>lua require('harpoon.ui').nav_prev()<CR>", { desc = "Navigate to previous mark" })
keymap("i", "<C-k>k", "<cmd>lua require('harpoon.mark').add_file()<CR>", { desc = "Add mark" })
-- keymap("i", "<C-k>u", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", { desc = "Toggle UI" })
keymap("i", "<C-k>n", "<cmd>lua require('harpoon.ui').nav_next()<CR>", { desc = "Navigate to next mark" })
keymap("i", "<C-k>p", "<cmd>lua require('harpoon.ui').nav_prev()<CR>", { desc = "Navigate to previous mark" })

