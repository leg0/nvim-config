autocmd BufRead,BufNewFile CMakeLists.txt set filetype=cmake
autocmd BufEnter *.cpp,*.h,*.hpp :lua vim.api.nvim_buf_set_option(0, "commentstring", "// %s")
