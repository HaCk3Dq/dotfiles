-- packer
require("impatient")
require("plugins")
vim.cmd("colorscheme nord")

-- settings
require("settings")
require("mason").setup()

-- ui
require("lualine").setup()
require("neoscroll").setup()
require("numb").setup()
require("true-zen").setup({
  modes = { ataraxis = { padding = { left = 250 } } },
})
require("lsp_signature").setup({})

require("settings.keymap")
