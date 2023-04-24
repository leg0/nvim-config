vim.opt.termguicolors = false
require('bufferline').setup {
  options = {
--    numbers = "ordinal",
    -- number_style = "superscript",
    themable = true,
    mappings = true,
    buffer_close_icon = "",
    modified_icon = "",
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    max_name_length = 19,
    max_prefix_length = 15,
    tab_size = 22,
    show_tab_indicators = true,
    enforce_regular_tabs = false,
    view = "multiwindow",
    show_buffer_close_icons = true,
    separator_style = "thick",
    always_show_bufferline = true,
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level)
      local icon = level:match("error") and " " or " "
      return " " .. icon .. count
    end,
    indicator = {
      style = "icon" -- h: bufferline-configuration
    },
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "center",
        padding = 1,
      },
    },
  },
}
