require('telescope').setup {
--     defaults = {},
--     pickers = {},
--     extensions = {}
}

-- Show line numbers in telescope preview window
vim.cmd "autocmd User TelescopePreviewerLoaded setlocal number"

-- Telescope
local opts = function(desc)
  return { desc = 'Telescope: '..desc, noremap = true, silent = true }
end
local builtin = require('telescope.builtin')
local keymap_fn = vim.keymap.set
keymap_fn('n', '<leader>tr', builtin.resume,       opts 'resume')

keymap_fn('n', '<leader>tf', builtin.find_files,   opts 'find files')
keymap_fn('n', '<leader>tg', builtin.live_grep,    opts 'live grep')
keymap_fn('n', '<leader>ts', builtin.grep_string,  opts 'grep string under cursor')
keymap_fn('n', '<leader>tb', builtin.buffers,      opts 'buffers')
keymap_fn('n', '<leader>tk', builtin.keymaps,      opts 'keymaps')
-- keymap('n', '<leader>fh', builtin.help_tags, opts 'help tags')

keymap_fn('n', '<leader>gf', builtin.git_files,    opts 'git files')
keymap_fn('n', '<leader>gs', builtin.git_stash,    opts 'git stashes')
keymap_fn('n', '<leader>gb', builtin.git_branches, opts 'git branches')
