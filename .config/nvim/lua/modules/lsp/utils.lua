local U = {}

U.mappings = function(bufnr)
  local opts = { buffer = bufnr }
  vim.keymap.set('n', '<leader>ac', '<cmd>FzfLua lsp_code_actions<cr>', opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('i', '<c-h>', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<space>ef', function()
    return vim.diagnostic.open_float()
  end, opts)
  vim.keymap.set({ 'n', 'v' }, '<f2>', function()
    return require('renamer').rename()
  end, opts)
end

U.disable_formatting = function(client)
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false
end

U.capabilities = require('cmp_nvim_lsp').default_capabilities()

return U
