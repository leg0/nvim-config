-- require('telescope').setup {
--     defaults = {},
--     pickers = {},
--     extensions = {}
-- }

local builtin = require('telescope.builtin')
local keymap = vim.keymap.set

keymap('n', '<leader>fr', builtin.resume, { desc = 'Telescope: resume' })

-- Find/grep
keymap('n', '<leader>ff', builtin.find_files, { desc = 'Telescope: find files' })
keymap('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope: live grep' })
keymap('n', '<leader>fs', builtin.grep_string, { desc = 'Telescope: grep string under cursor' })
keymap('n', '<leader>fb', builtin.buffers, { desc = 'Telescope: buffers' })
-- keymap('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope: help tags' })

-- Git related pickers
keymap('n', '<leader>gf', builtin.git_files, { desc = 'Telescope: git files' })
keymap('n', '<leader>gs', builtin.git_stash, { desc = 'Telescope: git stashes' })
keymap('n', '<leader>gb', builtin.git_branches, { desc = 'Telescope: git branches' })
