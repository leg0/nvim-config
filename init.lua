vim.api.nvim_command('set tabstop=4')
vim.api.nvim_command('set shiftwidth=4')
vim.api.nvim_command('set expandtab')
vim.api.nvim_command('set nowrap')

vim.api.nvim_command('set number')
vim.api.nvim_command('set numberwidth=5')

vim.api.nvim_command('set cursorline')
vim.api.nvim_command('colorscheme habamax')
-- vim.api.nvim_command('hi clear CursorLine')
-- vim.api.nvim_command('hi clear CursorLineNr')
-- vim.api.nvim_command('hi CursorLine cterm=NONE ctermbg=236 guibg=236')
-- vim.api.nvim_command('hi CursorLineNr cterm=NONE ctermbg=236 ctermfg=red guifg=red')

vim.api.nvim_command('hi Normal guibg=NONE ctermbg=NONE')

require('plugins')
require('lsp-clients')

