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
keymap("n", "<A-j>", ":m .+<CR>", opts)
keymap("n", "<A-k>", ":m .--<CR>", opts)

-- Move selection up and down in visual mode
keymap("v", "<A-j>", ":<C-u>exec \"'<,'>m \" . (line(\"'>\") + 1)<CR>gv", opts)
keymap("v", "<A-k>", ":m .--<cr>gv", opts)

-- Stay in visual mode after indenting
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

