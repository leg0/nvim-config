require('nvim_comment').setup({
    marker_padding = true,
    comment_empty = true,
    comment_empty_trim_whitespace = true,
})

local opts = function(desc)
  return { desc = desc, noremap = true, silent = true }
end
local keymap = vim.api.nvim_set_keymap

-- Toggle comments (Ctrl+/)
keymap("v", "<C-_>", ":CommentToggle<cr>gv", opts 'Toggle comment')
keymap("n", "<C-_>", ":CommentToggle<cr>",   opts 'Toggle comment')
keymap("v", "<C-/>", ":CommentToggle<cr>gv", opts 'Toggle comment')
keymap("n", "<C-/>", ":CommentToggle<cr>",   opts 'Toggle comment')
keymap("v", "<A-/>", ":CommentToggle<cr>gv", opts 'Toggle comment')
keymap("n", "<A-/>", ":CommentToggle<cr>",   opts 'Toggle comment')
