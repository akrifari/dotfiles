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
  float = {
    source = 'always',
    border = 'rounded',
  },
}

local borders = {
  { '╭', 'FloatBorder' },
  { '─', 'FloatBorder' },
  { '╮', 'FloatBorder' },
  { '│', 'FloatBorder' },
  { '╯', 'FloatBorder' },
  { '─', 'FloatBorder' },
  { '╰', 'FloatBorder' },
  { '│', 'FloatBorder' },
}

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = borders,
})

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = borders,
})
