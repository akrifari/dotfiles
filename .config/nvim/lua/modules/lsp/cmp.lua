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
  mapping = cmp.mapping.preset.insert {
    -- see: https://github.com/hrsh7th/nvim-cmp/discussions/1777
    ['<c-n>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
      else
        fallback()
      end
    end,
    ['<c-p>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
      else
        fallback()
      end
    end,
    ['<c-b>'] = cmp.mapping.scroll_docs(-4),
    ['<c-f>'] = cmp.mapping.scroll_docs(4),
    ['<c-y>'] = cmp.mapping.complete(),
    ['<c-l>'] = cmp.mapping.confirm { select = true },
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'buffer' },
    { name = 'luasnip' },
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  experimental = {
    ghost_text = true,
  },
}
