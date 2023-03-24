autocmd BufRead,BufNewFile CMakeLists.txt set filetype=cmake
autocmd BufEnter *.cpp,*.h :lua vim.api.nvim_buf_set_option(0, "commentstring", "// %s")
