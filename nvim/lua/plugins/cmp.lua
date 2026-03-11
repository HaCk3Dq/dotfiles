return {
  "saghen/blink.cmp",
  version = "*",
  dependencies = { "rafamadriz/friendly-snippets" },
  config = function()
    require("blink.cmp").setup({

      appearance = { nerd_font_variant = "mono" },
      signature = { enabled = false },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },

      keymap = {
        preset = "default",
        ["<Tab>"] = { "accept", "snippet_forward", "show", "fallback" },
        ["<S-Tab>"] = { "snippet_backward", "fallback" },
        ["<CR>"] = { "accept", "fallback" },
      },

      completion = {
        menu = {
          max_height = 20,
          draw = {
            columns = { { "kind_icon" }, { "label", gap = 1 } },
            components = {
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
