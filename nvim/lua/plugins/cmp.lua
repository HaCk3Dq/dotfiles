local cmp = require("cmp")
local lspkind = require("lspkind")
local luasnip = require("luasnip")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")

local has_words_before = function()
  local line, col = table.unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable( -1) then
        luasnip.jump( -1)
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<C-E>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm(),
  },
  sources = cmp.config.sources({
    { name = "nvim_lua", max_item_count = 10 },
    { name = "nvim_lsp", max_item_count = 10 },
    { name = "luasnip" },
    { name = "path",     max_item_count = 10 },
    { name = "buffer",   keyword_length = 4, max_item_count = 10 },
  }),
  preselect = cmp.PreselectMode.None,
  formatting = {
    format = lspkind.cmp_format({
      mode = "text",
      menu = {
        buffer = "Ω",
        nvim_lsp = "λ",
        path = "🖫",
        luasnip = ">",
      },
    }),
  },
})

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
