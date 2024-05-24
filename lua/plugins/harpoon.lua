local function keymap(mode, key, cmd, opts)
  if not opts then
    opts = {}
  end
  if opts.desc then
    opts.desc = "Harpoon: " .. opts.desc
  end
  vim.api.nvim_set_keymap(mode, key, cmd, opts)
end

return {
  "ThePrimeagen/harpoon",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim"
  },
  init = function()
  end,
  config = function()
    require("telescope").load_extension("harpoon")
    local harpoon = require("harpoon")
    harpoon.setup { }

    keymap("n", "<leader>kk", "<cmd>lua require('harpoon.mark').add_file()<CR>", { desc = "Add mark" })
    keymap("n", "<leader>ku", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", { desc = "Toggle UI" })
    keymap("n", "<leader>kn", "<cmd>lua require('harpoon.ui').nav_next()<CR>", { desc = "Navigate to next mark" })
    keymap("n", "<leader>kp", "<cmd>lua require('harpoon.ui').nav_prev()<CR>", { desc = "Navigate to previous mark" })
    keymap("i", "<C-k>k", "<cmd>lua require('harpoon.mark').add_file()<CR>", { desc = "Add mark" })
    -- keymap("i", "<C-k>u", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", { desc = "Toggle UI" })
    keymap("i", "<C-k>n", "<cmd>lua require('harpoon.ui').nav_next()<CR>", { desc = "Navigate to next mark" })
    keymap("i", "<C-k>p", "<cmd>lua require('harpoon.ui').nav_prev()<CR>", { desc = "Navigate to previous mark" })
  end
}

