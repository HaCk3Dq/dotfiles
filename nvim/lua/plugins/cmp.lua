local has_words_before = function()
  local line, col = table.unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    {
      "L3MON4D3/LuaSnip",
      version = "v2.*",
      build = "make install_jsregexp",
    },
    "onsails/lspkind-nvim",
    "hrsh7th/cmp-nvim-lua",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    require("luasnip.loaders.from_vscode").lazy_load()
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

    cmp.setup({

      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },

      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      mapping = cmp.mapping.preset.insert({
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
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<C-E>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm(),
      }),

      sources = cmp.config.sources({
        { name = "nvim_lsp", max_item_count = 20 },
        { name = "luasnip" },
        { name = "buffer", keyword_length = 4, max_item_count = 10 },
        { name = "path", max_item_count = 10 },
      }),

      formatting = {
        expandable_indicator = true,
        fields = { "kind", "abbr", "menu" },

        format = function(entry, vim_item)
          local lspkind = require("lspkind").cmp_format({
            mode = "symbol_text",
          })(entry, vim.deepcopy(vim_item))
          local highlights_info = require("colorful-menu").cmp_highlights(entry)

          -- highlight_info is nil means we are missing the ts parser, it's
          -- better to fallback to use default `vim_item.abbr`. What this plugin
          -- offers is two fields: `vim_item.abbr_hl_group` and `vim_item.abbr`.
          if highlights_info ~= nil then
            vim_item.abbr_hl_group = highlights_info.highlights
            vim_item.abbr = highlights_info.text
          end
          local strings = vim.split(lspkind.kind, "%s", { trimempty = true })
          vim_item.kind = "" .. (strings[1] or "") .. ""
          vim_item.menu = ""

          return vim_item
        end,
      },
    })
  end,
}
