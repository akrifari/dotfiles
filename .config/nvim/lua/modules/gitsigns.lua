local ok, gitsigns = pcall(require, 'gitsigns')
if not ok then
  return
end

gitsigns.setup {
  keymaps = {
    noremap = true,
    buffer = true,
    ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<cr>'" },
    ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<cr>'" },

    ['n gp'] = '<cmd>lua require"gitsigns".preview_hunk()<cr>',
    ['n <leader>gs'] = '<cmd>lua require"gitsigns".stage_hunk()<cr>',
    ['n <leader>gu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<cr>',
    ['n <leader>gr'] = '<cmd>lua require"gitsigns".reset_hunk()<cr>',
    ['n <leader>gR'] = '<cmd>lua require"gitsigns".reset_buffer()<cr>',
    ['n <leader>gb'] = '<cmd>lua require"gitsigns".blame_line(true)<cr>',
    ['n <leader>gB'] = '<cmd>Gitsigns toggle_current_line_blame<cr>',

    -- text objects
    ['o ih'] = ':<c-u>lua require"gitsigns.actions".select_hunk()<cr>',
    ['x ih'] = ':<c-u>lua require"gitsigns.actions".select_hunk()<cr>',
  },
  current_line_blame_opts = {
    delay = 100
  }
}
