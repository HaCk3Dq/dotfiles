-- packer
require('plugins')

-- settings
require('settings')
require('settings.color')
require('settings.completion')
require('settings.filetype')

-- ui
require('feline').setup()
vim.cmd 'colorscheme nord'

-- plugins
require('plugins.treesitter')
require('plugins.telescope')

