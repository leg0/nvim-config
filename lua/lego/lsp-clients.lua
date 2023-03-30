-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local lsp_flags = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, lsp_flags)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, lsp_flags)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, lsp_flags)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, lsp_flags)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('i', '<C-space>', vim.lsp.buf.completion, bufopts)

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

  --vim.keymap.set('n', '<space>dn', vim.diagnostic.goto_next, bufopts)
end

require('lspconfig')['pyright'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    root_dir = function()
        return vim.fs.dirname(vim.fs.find({'setup.py'}, { upward = true })[1])
    end,
}
require('lspconfig')['tsserver'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
-- Install language server: 'cargo install neocmakelsp'
require'lspconfig'.neocmake.setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
-- To install language server:
--  * On ubuntu 'sudo apt install clangd'
--  * On Windows, make sure that clangd.exe from LLVM is in the path or use the one bundled with Visual Studio
require'lspconfig'.clangd.setup{
    on_attach = on_attach,
    flags = lsp_flags,
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
    flags = lsp_flags,
    -- Server-specific settings...
}

--vim.lsp.start({
  -- name = 'my-server-name',
  -- cmd = {'name-of-language-server-executable'},
  -- root_dir = vim.fs.dirname(vim.fs.find({'setup.py', 'pyproject.toml'}, { upward = true })[1]),
--})
