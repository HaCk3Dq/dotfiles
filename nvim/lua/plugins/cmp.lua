local cmp = require('cmp')
local lspkind = require('lspkind')
local luasnip = require('luasnip')

cmp.setup({
  mapping = {
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-E>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm(),
  },

  sources = cmp.config.sources({
    { name = 'nvim_lua', max_item_count = 12 },
    { name = 'nvim_lsp', max_item_count = 12 },
    { name = 'luasnip' },
    { name = 'path', max_item_count = 12 },
    { name = 'buffer', max_item_count = 12, keyword_length = 5 },
  }),

  preselect = cmp.PreselectMode.None,

  formatting = {
    format = lspkind.cmp_format({
      mode = 'text',
      menu = {
        buffer = '[buf]',
        nvim_lsp = '[LSP]',
        nvim_lua = '[api]',
        path = '[path]',
        luasnip = '[snip]',
      },
    }),
  },

  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
})
