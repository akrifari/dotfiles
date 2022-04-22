local ok, gs = pcall(require, 'gitsigns')
if not ok then
  return
end

gs.setup {
  on_attach = function(bufnr)
    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    map('n', ']c', function()
      if vim.wo.diff then
        return ']c'
      end
      vim.schedule(function()
        gs.next_hunk()
      end)
      return '<ignore>'
    end, { expr = true })

    map('n', '[c', function()
      if vim.wo.diff then
        return '[c'
      end
      vim.schedule(function()
        gs.prev_hunk()
      end)
      return '<ignore>'
    end, { expr = true })

    map('n', 'gp', gs.preview_hunk)
    map({ 'n', 'v' }, '<leader>gs', gs.stage_hunk)
    map('n', '<leader>gS', gs.stage_buffer)
    map('n', '<leader>gu', gs.undo_stage_hunk)
    map('n', '<leader>gU', gs.reset_buffer_index)
    map({ 'n', 'v' }, '<leader>gr', gs.reset_hunk)
    map('n', '<leader>gR', gs.reset_buffer)
    map('n', '<leader>gb', function()
      gs.blame_line { full = true }
    end)
    map('n', '<leader>gB', gs.toggle_current_line_blame)

    map({ 'o', 'x' }, 'ih', ':<c-u>Gitsigns select_hunk<cr>')
  end,
  current_line_blame_opts = {
    delay = 100,
  },
}
