local ok, cmp = pcall(require, 'cmp')
if not ok then
  return
end

cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<c-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<c-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<c-y>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<c-l>'] = cmp.mapping.confirm { select = true },
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'buffer' },
    { name = 'luasnip' },
  },
  documentation = {
    border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
    winhighlight = 'NormalFloat:NormalFloat,FloatBorder:FloatBorder',
  },
  experimental = {
    ghost_text = true,
  },
}
