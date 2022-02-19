local ok, lspconfig = pcall(require, 'lspconfig')
if not ok then
  return
end

require 'modules.lsp.ui'

local servers = {
  tsserver = {
    -- run LSP in any directory
    root_dir = function()
      return vim.loop.cwd()
    end,
  },
  html = {},
  emmet_ls = {},
  cssls = {},
  jsonls = {
    settings = {
      json = {
        schemas = require('schemastore').json.schemas(),
      },
    },
  },
  gopls = {},
}

local U = require 'modules.lsp.utils'
local default_config = {
  on_attach = function(client, bufnr)
    U.disable_formatting(client)
    U.mappings(bufnr)
  end,
  capabilities = U.capabilities,
  flags = {
    debounce_text_changes = 150,
  },
}

for server, opts in pairs(servers) do
  lspconfig[server].setup(vim.tbl_extend('force', default_config, opts))
end
