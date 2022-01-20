local ok, gitsigns = pcall(require, 'gitsigns')
if not ok then
  return
end

gitsigns.setup {
  keymaps = {
    noremap = true,
    buffer = true,
    ['n ]c'] = { expr = true, "&diff ? ']c' : ':Gitsigns next_hunk<cr>'" },
    ['n [c'] = { expr = true, "&diff ? '[c' : ':Gitsigns prev_hunk<cr>'" },

    ['n gp'] = ':Gitsigns preview_hunk<cr>',
    ['n <leader>gs'] = ':Gitsigns stage_hunk<cr>',
    ['n <leader>gS'] = ':Gitsigns stage_buffer<cr>',
    ['n <leader>gu'] = ':Gitsigns undo_stage_hunk<cr>',
    ['n <leader>gU'] = ':Gitsigns reset_buffer_index<cr>',
    ['n <leader>gr'] = ':Gitsigns reset_hunk<cr>',
    ['n <leader>gR'] = ':Gitsigns reset_buffer<cr>',
    ['n <leader>gb'] = ':lua require"gitsigns".blame_line({full=true})<cr>',
    ['n <leader>gB'] = ':Gitsigns toggle_current_line_blame<cr>',

    -- text objects
    ['o ih'] = ':<c-u>Gitsigns select_hunk<cr>',
    ['x ih'] = ':<c-u>Gitsigns select_hunk<cr>',
  },
  current_line_blame_opts = {
    delay = 100
  }
}
