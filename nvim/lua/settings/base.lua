vim.g.python3_host_prog = "/usr/bin/python"
local o = vim.opt

o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.autoindent = true
o.wrap = false
o.clipboard = "unnamedplus"
o.listchars = { tab = ">>>", trail = "·", precedes = "←", extends = "→", eol = "↲", nbsp = "␣" }
o.swapfile = false
o.showmatch = true
o.undofile = true

o.splitright = true
o.splitbelow = true

o.ignorecase = true
o.smartcase = true

o.relativenumber = true
o.number = true
o.fillchars = { vert = " ", eob = " " }
o.cursorline = true
o.termguicolors = true
o.signcolumn = "yes"
o.title = true
o.ch = 0

o.foldlevel = 99
o.foldlevelstart = 99
o.foldenable = true
o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

vim.cmd("au TextYankPost * silent! lua vim.highlight.on_yank()")

vim.filetype.add({
  pattern = {
    [".*/.github/workflows/.*"] = "yaml.ghactions",
  },
})
