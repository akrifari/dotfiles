local signs = { 'Error', 'Warn', 'Hint', 'Info' }
for _, sign in pairs(signs) do
  local hl = 'DiagnosticSign' .. sign
  vim.fn.sign_define(hl, { text = ' ', texthl = hl, numhl = hl })
end

vim.diagnostic.config {
  severity_sort = true,
  update_in_insert = false,
  virtual_text = {
    source = 'always',
  },
  jump = {
    float = true,
  },
}
