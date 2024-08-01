local gitsigns_config = function()
  require 'gitsigns'.setup {
    on_attach = function(bufnr)
      -- This is the suggested key mapping by the authors
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        if opts.desc then
          opts.desc = 'Gitsigns:' .. opts.desc
        end
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map('n', ']c', function()
        if vim.wo.diff then return ']c' end
        vim.schedule(function() gs.next_hunk() end)
        return '<Ignore>'
      end, {expr=true, desc='next hunk'})

      map('n', '[c', function()
        if vim.wo.diff then return '[c' end
        vim.schedule(function() gs.prev_hunk() end)
        return '<Ignore>'
      end, {expr=true, desc='previous hunk'})

      -- Actions
      map('n', '<leader>hs', gs.stage_hunk,                                                     {desc='stage hunk'})
      map('n', '<leader>hr', gs.reset_hunk,                                                     {desc='reset hunk'})
      map('v', '<leader>hs', function() gs.stage_hunk {vim.fn.line("."), vim.fn.line("v")} end, {desc='stage hunk'})
      map('v', '<leader>hr', function() gs.reset_hunk {vim.fn.line("."), vim.fn.line("v")} end, {desc='reset hunk'})
      map('n', '<leader>hS', gs.stage_buffer,                                                   {desc='stage buffer'})
      map('n', '<leader>hu', gs.undo_stage_hunk,                                                {desc='undo stage hunk'})
      map('n', '<leader>hR', gs.reset_buffer,                                                   {desc='reset buffer'})
      map('n', '<leader>hp', gs.preview_hunk,                                                   {desc='preview hunk'})
      -- map('n', '<leader>hb', function() gs.blame_line{full=true} end,                           {desc='blame line'})
      map('n', '<leader>hb', gs.toggle_current_line_blame,                                      {desc='toggle current line blame'})
      map('n', '<leader>hd', gs.diffthis,                                                       {desc='diffthis'})
      map('n', '<leader>hD', function() gs.diffthis('~') end,                                   {desc='diffthis~'})
      map('n', '<leader>td', gs.toggle_deleted,                                                 {desc='toggle deleted'})

      -- Text object
      map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>',                                   {desc='select hunk'})
    end,
    signs                        = {
      add          = { text = '│' },
      change       = { text = '│' },
      delete       = { text = '_' },
      topdelete    = { text = '‾' },
      changedelete = { text = '~' },
      untracked    = { text = '┆' },
    },
    -- TODO add keymaps
    signcolumn                   = true,  -- Toggle with `:Gitsigns toggle_signs`
    numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
    linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
    watch_gitdir                 = {
      interval = 1000,
      follow_files = true
    },
    attach_to_untracked          = true,
    current_line_blame           = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts      = {
      virt_text = true,
      virt_text_pos = 'right_align', -- 'eol' | 'overlay' | 'right_align'
      delay = 500,
      ignore_whitespace = false,
    },
    current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
    sign_priority                = 6,
    update_debounce              = 100,
    status_formatter             = nil,   -- Use default
    max_file_length              = 40000, -- Disable if file is longer than this (in lines)
    preview_config               = {
      -- Options passed to nvim_open_win
      border   = 'single',
      style    = 'minimal',
      relative = 'cursor',
      row      = 0,
      col      = 1
    },
  }
end

return {
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",
  init = function() end,
  config = gitsigns_config,
}
