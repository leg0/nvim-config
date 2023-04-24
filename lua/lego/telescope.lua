require('telescope').setup {
--     defaults = {},
--     pickers = {},
--     extensions = {}
}

-- Telescope
local opts = function(desc)
  return { desc = desc, noremap = true, silent = true }
end
local builtin = require('telescope.builtin')
local keymap_fn = vim.keymap.set
keymap_fn('n', '<leader>tr', builtin.resume,       opts 'Telescope: resume')

keymap_fn('n', '<leader>tf', builtin.find_files,   opts 'Telescope: find files')
keymap_fn('n', '<leader>tg', builtin.live_grep,    opts 'Telescope: live grep')
keymap_fn('n', '<leader>ts', builtin.grep_string,  opts 'Telescope: grep string under cursor')
keymap_fn('n', '<leader>tb', builtin.buffers,      opts 'Telescope: buffers')
keymap_fn('n', '<leader>tk', builtin.keymaps,      opts 'Telescope: keymaps')
-- keymap('n', '<leader>fh', builtin.help_tags, opts 'Telescope: help tags')

keymap_fn('n', '<leader>gf', builtin.git_files,    opts 'Telescope: git files')
keymap_fn('n', '<leader>gs', builtin.git_stash,    opts 'Telescope: git stashes')
keymap_fn('n', '<leader>gb', builtin.git_branches, opts 'Telescope: git branches')
