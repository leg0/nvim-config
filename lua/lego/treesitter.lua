require 'nvim-treesitter.configs'.setup {
  indent = {
    enable = true
  },
  highlight = {
    enable = true
  },
  ensure_installed = {
    'bash',
    'c',
    'cpp',
    'cmake',
    'html',
    'javascript',
    'json',
    'lua',
    'python',
    'regex',
    'tsx',
    'typescript',
  }
}
