local U = {}

U.mappings = function(bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  local opts = { noremap = true, silent = true }

  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
  buf_set_keymap('n', '<leader>ac', '<cmd>FzfLua lsp_code_actions<cr>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
  buf_set_keymap('n', '[g', '<cmd>lua vim.diagnostic.goto_prev({ float = { border = "rounded" }})<cr>', opts)
  buf_set_keymap('n', ']g', '<cmd>lua vim.diagnostic.goto_next({ float = { border = "rounded" }})<cr>', opts)
  buf_set_keymap('i', '<c-h>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
  buf_set_keymap('n', '<f2>', '<cmd>lua require("renamer").rename()<cr>', opts)
  buf_set_keymap('v', '<f2>', '<cmd>lua require("renamer").rename()<cr>', opts)
end

U.disable_formatting = function(client)
  client.resolved_capabilities.document_formatting = false
  client.resolved_capabilities.document_range_formatting = false
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
U.capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

return U
