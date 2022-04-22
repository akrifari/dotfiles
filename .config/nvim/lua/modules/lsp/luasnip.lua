local ok, luasnip = pcall(require, 'luasnip')
if not ok then
  return
end

require('luasnip.loaders.from_vscode').lazy_load()

vim.keymap.set({ 'i', 's' }, '<c-j>', function()
  return luasnip.jump(1)
end)
vim.keymap.set({ 'i', 's' }, '<c-k>', function()
  return luasnip.jump(-1)
end)
