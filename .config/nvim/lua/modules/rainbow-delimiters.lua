local ok, rd = pcall(require, 'rainbow-delimiters')
if not ok then
  return
end

vim.g.rainbow_delimiters = {
  strategy = {
    [''] = rd.strategy['global'],
    vim = rd.strategy['local'],
  },
  query = {
    [''] = 'rainbow-delimiters',
    lua = 'rainbow-blocks',
  },
  highlight = {
    'RainbowDelimiterOutest',
    'RainbowDelimiterViolet',
    'RainbowDelimiterOrange',
    'RainbowDelimiterBlue',
    'RainbowDelimiterGreen',
    'RainbowDelimiterYellow',
    'RainbowDelimiterRed',
  },
}
