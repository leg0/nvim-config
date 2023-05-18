vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.scrolloff = 10
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.api.nvim_command('set expandtab')
vim.api.nvim_command('set nowrap')
vim.api.nvim_command('set number')
vim.opt.numberwidth = 5

vim.opt.cursorline = true
vim.api.nvim_command('colorscheme habamax')
-- vim.api.nvim_command('hi clear CursorLine')
-- vim.api.nvim_command('hi clear CursorLineNr')
-- vim.api.nvim_command('hi CursorLine cterm=NONE ctermbg=236 guibg=236')
-- vim.api.nvim_command('hi CursorLineNr cterm=NONE ctermbg=236 ctermfg=red guifg=red')

vim.api.nvim_command('hi WinSeparator guibg=NONE ctermbg=NONE')
vim.api.nvim_command('hi Normal guibg=NONE ctermbg=NONE')
-- Override ugly highlight for some cmake's keywords
-- vim.api.nvim_command('hi ModeMsg guibg=NONE ctermbg=NONE ctermfg=173 guifg=#d7875f')

vim.api.nvim_command('set guifont=Cascadia\\ Mono\\ ExtraLight:h10')
