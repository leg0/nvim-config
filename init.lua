vim.api.nvim_command('set tabstop=4')
vim.api.nvim_command('set shiftwidth=4')
vim.api.nvim_command('set expandtab')

vim.api.nvim_command('set number')
vim.api.nvim_command('set numberwidth=5')

vim.api.nvim_command('set cursorline')
vim.api.nvim_command('colorscheme habamax')
-- vim.api.nvim_command('hi clear CursorLine')
-- vim.api.nvim_command('hi clear CursorLineNr')
-- vim.api.nvim_command('hi CursorLine cterm=NONE ctermbg=236 guibg=236')
-- vim.api.nvim_command('hi CursorLineNr cterm=NONE ctermbg=236 ctermfg=red guifg=red')

vim.api.nvim_command('hi Normal guibg=NONE ctermbg=NONE')

-- local use = require('packer').use
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- Package manager
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
end)

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

require('lspconfig')['pyright'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['tsserver'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require'lspconfig'.neocmake.setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
-- On ubuntu install 'sudo apt install clangd'
-- On Windows, make sure that clangd.exe from LLVM is in the path, or TODO: set cmd
require'lspconfig'.clangd.setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
--
--require('lspconfig')['rust_analyzer'].setup{
--    on_attach = on_attach,
--    flags = lsp_flags,
--    -- Server-specific settings...
--    settings = {
--      ["rust-analyzer"] = {}
--    }
--}

--vim.lsp.start({
  -- name = 'my-server-name',
  -- cmd = {'name-of-language-server-executable'},
  -- root_dir = vim.fs.dirname(vim.fs.find({'setup.py', 'pyproject.toml'}, { upward = true })[1]),
--})
