return {
  "saghen/blink.cmp",
  version = "*",
  dependencies = { "rafamadriz/friendly-snippets" },
  config = function()
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
        ["<Tab>"] = { "accept", "snippet_forward", "show", "fallback" },
        ["<S-Tab>"] = { "snippet_backward", "fallback" },
        ["<CR>"] = { "accept", "fallback" },
      },

      completion = {
        documentation = { auto_show = true },
        menu = {
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
