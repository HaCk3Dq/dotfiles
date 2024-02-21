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
require("lsp_signature").setup({})

require("settings.keymap")
