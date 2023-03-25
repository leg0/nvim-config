-- Modes
--  n   = Normal mode
--  i   = Insert mode
--  v   = Visual mode
--  x   = Visual block mode
--  t   = Term mode
--  c   = Command mode

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Open file explorer on <space>e
-- keep pasting the same thing, not the stuff that was replaced?
keymap("n", "<leader>e", ":Lexplore 30<CR>", opts)

-- Move single line up and down in normal mode
keymap("n", "<A-Up>", ":m .--<CR>", opts)
keymap("n", "<A-Down>", ":m .+<CR>", opts)

-- Move selection up and down in visual mode
keymap("v", "<A-Up>", ":m .--<cr>gv", opts)
keymap("v", "<A-Down>", ":<C-u>exec \"'<,'>m \" . (line(\"'>\") + 1)<CR>gv", opts)

-- Stay in visual mode after indenting
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Keep search result in the middle of the screen
keymap("n", "n", "nzz", opts)

-- Toggle comments (Ctrl+/)
keymap("n", "<C-_>", ":CommentToggle<cr>", opts)
keymap("v", "<C-_>", ":CommentToggle<cr>gv", opts)

