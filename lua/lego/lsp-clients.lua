-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local lsp_flags = function(desc)
  local res = { noremap=true, silent=true }
  if desc then
    res.desc = desc
  end
  return res
end

vim.keymap.set('n', '<space>w', vim.diagnostic.open_float, lsp_flags 'Expand disagnostic in float')
vim.keymap.set('n', ']d', vim.diagnostic.goto_next,        lsp_flags 'Go to next diagnostic')
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev,        lsp_flags 'Go to previous diagnostic')
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, lsp_flags 'Set loclist')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = function(desc)
    return { noremap=true, silent=true, buffer=bufnr, desc = desc }
  end
  vim.keymap.set('i', '<C-space>', vim.lsp.buf.completion, bufopts 'Trigger completion')

  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration,                 bufopts 'Go to declaration')
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition,                  bufopts 'Go to definition')
  vim.keymap.set('n', 'K', vim.lsp.buf.hover,                        bufopts 'Hover')
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation,              bufopts 'Go to implementation')
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help,           bufopts 'Signature help')
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts 'Add workspace folder')
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts 'Remove workspace folder')
  vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, bufopts 'List workspace folders')
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts 'Go to type definition')
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename,         bufopts 'Refactor: rename')
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action,    bufopts 'Code action')
  vim.keymap.set('n', 'gr', vim.lsp.buf.references,            bufopts 'Show references')
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts 'Format file')

  --vim.keymap.set('n', '<space>dn', vim.diagnostic.goto_next, bufopts)
end

require('lspconfig')['pyright'].setup{
    on_attach = on_attach,
    flags = lsp_flags(),
    root_dir = function()
        return vim.fs.dirname(vim.fs.find({'setup.py'}, { upward = true })[1])
    end,
}
require('lspconfig')['tsserver'].setup{
    on_attach = on_attach,
    flags = lsp_flags(),
}
-- Install language server: 'cargo install neocmakelsp'
require'lspconfig'.neocmake.setup{
    on_attach = on_attach,
    flags = lsp_flags(),
}
-- To install language server:
--  * On ubuntu 'sudo apt install clangd'
--  * On Windows, make sure that clangd.exe from LLVM is in the path or use the one bundled with Visual Studio
require'lspconfig'.clangd.setup{
    on_attach = on_attach,
    flags = lsp_flags(),
    cmd = (function()
        if vim.fn.has('linux') then
            return nil
        end
        if vim.fn.has('win32') then
            return { "C:/Program Files/Microsoft Visual Studio/2022/Enterprise/VC/Tools/Llvm/bin/clangd.exe" }
        end
        return nil
    end)()
}

require('lspconfig').rust_analyzer.setup{
    on_attach = on_attach,
    flags = lsp_flags(),
    -- Server-specific settings...
}

require('lspconfig').lua_ls.setup {
    on_attach = on_attach,
    flags = lsp_flags(),
}
--vim.lsp.start({
  -- name = 'my-server-name',
  -- cmd = {'name-of-language-server-executable'},
  -- root_dir = vim.fs.dirname(vim.fs.find({'setup.py', 'pyproject.toml'}, { upward = true })[1]),
--})

