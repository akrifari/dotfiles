vim.cmd [[
function! MyHighlights() abort
  " statusline
  highlight clear StatusLine
  highlight clear StatusLineNC
  highlight StatusLine ctermbg=NONE
  highlight StatusLineNC ctermbg=NONE ctermfg=238 guifg=#424450

  highlight link User1 TNGreen
  highlight link User2 TNBlue
  highlight link User3 TNCyan
  highlight link User4 TNRed
  highlight link User5 TNOrange
  highlight link User6 TNMagenta
  highlight link User7 TNYellow
  highlight link User8 TNGray

  " tokyonight color pallete
  highlight TNRed guifg=#f7768e
  highlight TNGreen guifg=#9ece6a
  highlight TNYellow guifg=#e0af68
  highlight TNBlue guifg=#7aa2f7
  highlight TNMagenta guifg=#bb9af7
  highlight TNCyan guifg=#7dcfff
  highlight TNGray guifg=#565f89
  highlight TNOrange guifg=#ff9e64

  " hint
  highlight! link CocHintSign DiagnosticHint
  highlight! link CocHintFloat DiagnosticHint

  " info
  highlight! link CocInfoSign DiagnosticInfo
  highlight! link CocInfoFloat DiagnosticInfo

  " warning
  highlight! link WarningMsg DiagnosticWarn
  highlight! link CocWarningSign DiagnosticWarn
  highlight! link CocWarningFloat DiagnosticWarn

  " error
  highlight! link ErrorMsg DiagnosticError
  highlight! link CocErrorSign DiagnosticError
  highlight! link CocErrorFloat DiagnosticError

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
