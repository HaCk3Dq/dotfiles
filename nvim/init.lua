-- packer
require('plugins')
vim.cmd 'colorscheme nord'

-- settings
require('settings')
require('settings.color')
require('settings.completion')
require('settings.filetype')

-- ui
require('feline').setup()

-- LSP
require('lsp')

-- plugins
require('plugins.treesitter')
require('plugins.telescope')
require('plugins.colorizer')

require('settings.keymap')

