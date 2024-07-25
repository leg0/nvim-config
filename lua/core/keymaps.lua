local opts = function(desc)
  return { desc = desc, noremap = true, silent = true }
end
local keymap = vim.api.nvim_set_keymap

-- delete gc and gcc keymaps
vim.keymap.del('n', 'gc')
vim.keymap.del('n', 'gcc')

-- Navigate between buffers
keymap('n', '<S-Right>', ':bn<cr>',       opts 'Next buffer')
keymap('i', '<S-Right>', '<Esc>:bn<cr>i', opts 'Next buffer')
keymap('n', '<S-Left>', ':bp<cr>',        opts 'Previous buffer')
keymap('i', '<S-Left>', '<Esc>:bp<cr>i',  opts 'Previous buffer')

-- Move single line up and down in normal mode
keymap("n", "<A-Up>",   ":m .--<CR>", opts 'Move line up')
keymap("n", "<A-Down>", ":m .+<CR>",  opts 'Move line down')

-- Move selection up and down in visual mode
keymap("v", "<A-Up>", ":m .--<cr>gv", opts 'Move selection up')
keymap("v", "<A-Down>", ":<C-u>exec \"'<,'>m \" . (line(\"'>\") + 1)<CR>gv", opts 'Move selection down')

-- Stay in visual mode after indenting
keymap("v", "<", "<gv", opts 'Indent left')
keymap("v", ">", ">gv", opts 'Indent right')

-- Keep search result in the middle of the screen
keymap("n", "n", "nzz", opts 'Search next')
keymap("n", "N", "Nzz", opts 'Search previous')

-- Move between splits with Ctrl+Arrow
keymap("n", "<C-Up>", "<C-W>k",    opts 'Move to split above')
keymap("n", "<C-Down>", "<C-W>j",  opts 'Move to split below')
keymap("n", "<C-Left>", "<C-W>h",  opts 'Move to split left')
keymap("n", "<C-Right>", "<C-W>l", opts 'Move to split right')
