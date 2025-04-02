return {
  "gbprod/substitute.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local substitute = require("substitute")
    local k = vim.keymap
    substitute.setup()

    k.set("n", "s", substitute.operator)
    k.set("n", "sS", substitute.eol)
    k.set("n", "ss", substitute.line)
    k.set("x", "s", substitute.visual)
  end,
}
