local colorscheme = require 'tokyonight'
local colors = require('tokyonight.colors').setup()
local util = require 'tokyonight.util'

colorscheme.setup {
  style = 'storm',
  sidebars = { 'qf' },
  on_colors = function(c)
    c.gitSigns = {
      add = colors.green,
      change = colors.orange,
      delete = colors.red,
    }
    c.git = {
      add = colors.green,
      change = colors.orange,
      delete = colors.red,
      conflict = colors.yellow,
    }
  end,
  on_highlights = function(hl, c)
    hl.LineNr = { fg = util.darken(c.blue, 0.3) }
    -- override current line number color in favor of `set laststatus=3`
    hl.CursorLineNr = { fg = c.blue }
  end
}

-- this line needs to be appeared after configuration above, otherwise the
-- statusline colors customization in statusline.lua won't work as expected
vim.cmd.colorscheme("tokyonight")
