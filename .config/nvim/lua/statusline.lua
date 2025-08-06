local ok, lualine = pcall(require, 'lualine')
if not ok then
  return
end

local colors = require("tokyonight.colors").setup()

lualine.setup({
  options = {
    theme = 'tokyonight',
    component_separators = '',
    section_separators = '',
    ignore_focus = { 'NvimTree' },
  },
  sections = {
    lualine_a = {
      {
        'mode',
        color = { gui = 'bold' },
      }
    },
    lualine_b = {},
    lualine_c = {
      {
        'filename',
        path = 1
      },
      'diagnostics',
    },
    lualine_x = {
      {
        'diff',
        symbols = { added = ' ', modified = ' ', removed = ' ' },
      },
      {
        'branch',
        icon = '',
        color = { fg = colors.blue }
      },
      'filetype'
    },
    lualine_y = {},
    lualine_z = {'location'},
  },
})
