-- packer
require('plugins')
vim.cmd 'colorscheme nord'

-- settings
require('settings')
require("mason").setup()

-- ui
require('feline').setup()
require('neoscroll').setup()
require('numb').setup()
require('true-zen').setup({
  modes = { ataraxis = { padding = { left = 250 } } }
})

require('settings.keymap')

