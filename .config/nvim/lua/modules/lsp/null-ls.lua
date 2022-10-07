local ok, null_ls = pcall(require, 'null-ls')
if not ok then
  return
end

null_ls.setup {
  sources = {
    null_ls.builtins.formatting.trim_whitespace,
    null_ls.builtins.formatting.prettierd.with {
      env = {
        PRETTIERD_DEFAULT_CONFIG = vim.fn.expand '~/.config/nvim/.prettierrc',
      },
    },
    null_ls.builtins.formatting.eslint_d.with {
      condition = function(utils)
        return utils.root_has_file { '.eslintrc', '.eslintrc.js' }
      end,
    },
    null_ls.builtins.formatting.gofmt,
    null_ls.builtins.diagnostics.eslint_d.with {
      condition = function(utils)
        return utils.root_has_file { '.eslintrc', '.eslintrc.js' }
      end,
    },
  },
  on_attach = function(client, bufnr)
    if client.server_capabilities.documentFormattingProvider then
      local group = vim.api.nvim_create_augroup('LspFormatting', { clear = true })
      vim.api.nvim_create_autocmd('BufWritePre', {
        callback = vim.lsp.buf.formatting_sync,
        buffer = bufnr,
        group = group,
      })
    end
  end,
}
