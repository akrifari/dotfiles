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
    null_ls.builtins.formatting.eslint_d,
    null_ls.builtins.formatting.gofmt,
    null_ls.builtins.diagnostics.eslint_d,
  },
  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      vim.cmd [[
        augroup LspFormatting
          autocmd! * <buffer>
          autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
        augroup END
      ]]
    end
  end,
}
