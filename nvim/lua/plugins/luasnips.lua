local luasnip = require("luasnip")

luasnip.config.set_config({
  history = true,
  enable_autosnippets = true,
  updateevents = "TextChanged,TextChangedI",
})
