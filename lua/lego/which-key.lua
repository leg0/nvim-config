require('which-key').setup {
  marks = true,
  registers = true,
  presets = {
    operators = true,
    motions = true,
    text_objects = true,
    windows = true,
    nav = true,
    z = true,
    g = true,
  },
  motions = {
    count = true,
  },
  icond = {
    breadcrumb = "»",
    separator = "➜",
    group = "+",
   }

}
