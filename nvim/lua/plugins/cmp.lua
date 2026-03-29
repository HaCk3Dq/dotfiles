return {
  "saghen/blink.cmp",
  version = "*",
  dependencies = { "rafamadriz/friendly-snippets" },
  config = function()
    local has_words_before = function()
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    require("blink.cmp").setup({

      appearance = { nerd_font_variant = "mono" },
      signature = { enabled = true },
      sources = {
        default = { "lazydev", "lsp", "path", "snippets", "buffer" },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100,
          },
        },
      },

      keymap = {
        preset = "default",
        ["<Tab>"] = {
          function(cmp)
            if cmp.is_visible() then
              return cmp.select_next()
            end

            if cmp.snippet_active({ direction = 1 }) then
              return cmp.snippet_forward()
            end

            if has_words_before() then
              return cmp.show()
            end
          end,
          "accept",
          "fallback",
        },
        ["<S-Tab>"] = {
          function(cmp)
            if cmp.is_visible() then
              return cmp.select_prev()
            end

            if cmp.snippet_active({ direction = -1 }) then
              return cmp.snippet_backward()
            end
          end,
          "fallback",
        },
        ["<CR>"] = { "accept", "fallback" },
      },

      completion = {
        documentation = { auto_show = true },
        ghost_text = { enabled = true },
        menu = {
          auto_show_delay_ms = 2000,
          max_height = 20,
          draw = {
            columns = { { "kind_icon" }, { "label", gap = 1 } },
            components = {
              kind_icon = {
                highlight = function(ctx)
                  return ctx.kind_hl
                end,
              },
              label = {
                text = function(ctx)
                  return require("colorful-menu").blink_components_text(ctx)
                end,
                highlight = function(ctx)
                  return require("colorful-menu").blink_components_highlight(ctx)
                end,
              },
            },
          },
        },
      },
    })
  end,
}
