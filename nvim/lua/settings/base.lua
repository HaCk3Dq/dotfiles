local o = vim.opt

o.relativenumber = true
o.number = true

o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.autoindent = true
o.wrap = false
o.clipboard = "unnamedplus"

o.splitright = true
o.splitbelow = true

o.ignorecase = true
o.smartcase = true

o.cursorline = true
o.termguicolors = true
o.signcolumn = "yes"
o.title = true
o.ch = 0

vim.cmd("au TextYankPost * silent! lua vim.highlight.on_yank()")
