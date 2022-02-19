local ok, _ = pcall(require, 'luasnip')
if not ok then
  return
end

require('luasnip.loaders.from_vscode').lazy_load()

local opts = { noremap = true }

vim.api.nvim_set_keymap('i', '<c-j>', '<cmd>lua require("luasnip").jump(1)<cr>', opts)
vim.api.nvim_set_keymap('i', '<c-k>', '<cmd>lua require("luasnip").jump(-1)<cr>', opts)
vim.api.nvim_set_keymap('s', '<c-j>', '<cmd>lua require("luasnip").jump(1)<cr>', opts)
vim.api.nvim_set_keymap('s', '<c-k>', '<cmd>lua require("luasnip").jump(-1)<cr>', opts)
