local colors = require("tokyonight.colors").setup()
local util = require("tokyonight.util")

vim.g.tokyonight_sidebars = { "qf", "nerdtree" }
vim.g.tokyonight_colors = {
  gitSigns = {
    add = colors.green,
    change = colors.orange,
    delete = colors.red,
  },
  git = {
    add = colors.green,
    change = colors.orange,
    delete = colors.red,
    conflict = colors.yellow,
  }
}
vim.cmd [[colorscheme tokyonight]]

local highlights = {
  Statusline = { ctermbg = colors.none },
  StatusLineNC = { ctermbg = colors.none, ctermfg = 0, fg = colors.none },
  TNRed = { fg = colors.red },
  TNRed1 = { fg = colors.red1 },
  TNGreen = { fg = colors.green },
  TNYellow = { fg = colors.yellow },
  TNBlue = { fg = colors.blue },
  TNMagenta = { fg = colors.magenta },
  TNCyan = { fg = colors.cyan },
  TNGray = { fg = colors.comment },
  TNOrange = { fg = colors.orange },
  TNTeal = { fg = colors.teal },
  TNBlue2 = { fg = colors.blue2 },
  LineNr = { fg = util.darken(colors.blue, 0.3) },
}

for group_name, opts in pairs(highlights) do
  vim.api.nvim_set_hl(0, group_name, opts)
end
