local actions = require('telescope.actions')
require('telescope').setup {
  -- },
--     defaults = {},
--     pickers = {},
--     extensions = {}
  defaults = {
    mappings = {
      i = {
        ["<Ins>"] = actions.toggle_selection + actions.move_selection_better,
        ["<S-Up>"] = function(prompt_bufnr)
          actions.toggle_selection(prompt_bufnr)
          actions.move_selection_previous(prompt_bufnr)
        end,
        ["<S-Down>"] = function(prompt_bufnr)
          actions.toggle_selection(prompt_bufnr)
          actions.move_selection_next(prompt_bufnr)
        end,
      }
    }
  }
}

-- Show line numbers in telescope preview window
vim.cmd "autocmd User TelescopePreviewerLoaded setlocal number"

local git_status_opts = {
  git_icons = {
    changed = "",
    added = "",
    removed = "",
    copied = "",
    renamed = "",
    unmerged = "",
    untracked = "",
  }
}

vim.api.nvim_set_hl(0, 'TelescopeResultsDiffAdd', { ctermfg=108, bold=true })
vim.api.nvim_set_hl(0, 'TelescopeResultsDiffDelete', { ctermfg='red', bold=true })
vim.api.nvim_set_hl(0, 'TelescopeResultsDiffChange', { ctermfg='yellow', bold=true })
vim.api.nvim_set_hl(0, 'TelescopeResultsDiffUntracked', { ctermfg='gray', bold=true })

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
keymap_fn('n', '<leader>gt', builtin.git_stash,    opts 'git stashes')
keymap_fn('n', '<leader>gb', builtin.git_branches, opts 'git branches')
keymap_fn('n', '<leader>gs', function() builtin.git_status(git_status_opts) end,   opts 'git status')
