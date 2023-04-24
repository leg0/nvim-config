-- Modes
--  n   = Normal mode
--  i   = Insert mode
--  v   = Visual mode
--  x   = Visual block mode
--  t   = Term mode
--  c   = Command mode

local opts = function(desc)
  return { desc = desc, noremap = true, silent = true }
end
local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts 'Nop')
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- File explorer
-- TODO move to nvim-tree.lua
keymap("n", "<leader>ee", ":NvimTreeOpen<cr>",     opts 'Open file explorer')
keymap("n", "<leader>ec", ":NvimTreeClose<cr>",    opts 'Close file explorer')
keymap("n", "<leader>ef", ":NvimTreeFindFile<cr>", opts 'Find file in file explorer')

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

-- Toggle comments (Ctrl+/)
keymap("v", "<C-_>", ":CommentToggle<cr>gv", opts 'Toggle comment')
keymap("n", "<C-_>", ":CommentToggle<cr>",   opts 'Toggle comment')

-- Move between splits with Ctrl+Arrow
keymap("n", "<C-Up>", "<C-W>k",    opts 'Move to split above')
keymap("n", "<C-Down>", "<C-W>j",  opts 'Move to split below')
keymap("n", "<C-Left>", "<C-W>h",  opts 'Move to split left')
keymap("n", "<C-Right>", "<C-W>l", opts 'Move to split right')

