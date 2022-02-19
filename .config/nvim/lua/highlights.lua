vim.cmd [[
function! MyHighlights() abort
  " statusline
  highlight clear StatusLine
  highlight clear StatusLineNC
  highlight StatusLine ctermbg=NONE
  highlight StatusLineNC ctermbg=NONE ctermfg=238 guifg=#424450

  " tokyonight color pallete
  highlight TNRed guifg=#f7768e
  highlight TNRed1 guifg=#db4b4b
  highlight TNGreen guifg=#9ece6a
  highlight TNYellow guifg=#e0af68
  highlight TNBlue guifg=#7aa2f7
  highlight TNMagenta guifg=#bb9af7
  highlight TNCyan guifg=#7dcfff
  highlight TNGray guifg=#565f89
  highlight TNOrange guifg=#ff9e64
  highlight TNTeal guifg=#1abc9c
  highlight TNBlue2 guifg=#0db9d7

  " bump line number color by 30% (TNBlue -> #465986)
  highlight LineNr guifg=#465986
endfunction
]]

vim.cmd [[
augroup MyColors
  autocmd!
  autocmd ColorScheme * call MyHighlights()
augroup END
]]

-- always set colorscheme after defining custom highlights otherwise the
-- statusline color will mess up
local colors = require("tokyonight.colors").setup()
vim.g.tokyonight_sidebars = {"qf", "nerdtree"}
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
