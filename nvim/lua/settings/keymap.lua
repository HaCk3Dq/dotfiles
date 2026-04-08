local map = vim.keymap.set
local opts = { noremap = true, silent = true }
local ts_select = require("nvim-treesitter-textobjects.select")
local ts_move = require("nvim-treesitter-textobjects.move")

local function select_textobject(query)
  return function()
    ts_select.select_textobject(query, "textobjects")
  end
end

local function goto_next_start(query)
  return function()
    ts_move.goto_next_start(query, "textobjects")
  end
end

local function goto_previous_start(query)
  return function()
    ts_move.goto_previous_start(query, "textobjects")
  end
end

map("n", "<F3>", ":set relativenumber!<CR>", opts)
map("n", "<F4>", ":set list!<CR>", opts)
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)
map("n", "<C-\\>", ":Neotree toggle<CR>", opts)
map("n", "<esc>", ":noh<CR>", opts)
map({ "n", "x", "o" }, "m", "%", opts)
map("n", "`", "g~iw", opts)
map("v", "`", "g~", opts)
map("n", "<C-j>", "J", opts)
map("v", "<C-j>", "J", opts)

-- Substitute
map("n", "s", require("substitute").operator, opts)
map("n", "ss", require("substitute").line, opts)
map("n", "S", require("substitute").eol, opts)
map("x", "s", require("substitute").visual, opts)

-- Spider
map({ "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>", opts)
map({ "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>", opts)
map({ "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>", opts)
map({ "n", "o", "x" }, "ge", "<cmd>lua require('spider').motion('ge')<CR>", opts)

-- Buffers
map("n", "J", ":BufferPrevious<CR>", opts)
map("n", "K", ":BufferNext<CR>", opts)
map("n", "<A-j>", ":BufferMovePrevious<CR>", opts)
map("n", "<A-k>", ":BufferMoveNext<CR>", opts)
map("n", "<C-w>", ":BufferClose<CR>", { nowait = true })
map("n", "<S-x>", ":BufferRestore<CR>", opts)

-- Splits
map("n", "<F26>", ":vsp<CR>", opts)
map("n", "<F14>", ":sp<CR>", opts)
map("n", "<A-a>", ":wincmd h<CR>", opts)
map("n", "<A-d>", ":wincmd l<CR>", opts)
map("n", "<A-s>", ":wincmd j<CR>", opts)
map("n", "<A-w>", ":wincmd k<CR>", opts)
map("n", "<C-X>", ":close<CR>", opts)
map("n", "<A-A>", ":vertical resize -1<CR>", opts)
map("n", "<A-D>", ":vertical resize +1<CR>", opts)

-- Git
map("n", "<leader>g", ":LazyGit<CR>", opts)
map("n", "<space>gv", ":lua require('gitsigns').preview_hunk()<CR>", opts)
map("n", "<space>gr", ":lua require('gitsigns').reset_hunk()<CR>", opts)
map("n", "<space>gR", ":lua require('gitsigns').reset_buffer()<CR>", opts)
map("n", "<space>gb", ":lua require('gitsigns').toggle_current_line_blame()<CR>", opts)

-- LSP
map("n", "<space>d", ":Telescope lsp_definitions<CR>", opts)
map("n", "<space>h", ":lua vim.lsp.buf.hover()<CR>", opts)
map("n", "<space>r", ":Telescope lsp_references<CR>", opts)
map("n", "<space>R", ":lua vim.lsp.buf.rename()<CR>", opts)
map("n", "<space>e", ":lua vim.diagnostic.open_float()<CR>", opts)
map("n", "<space>s", ":Telescope lsp_document_symbols<CR>", opts)
map("n", "<space>a", ":Telescope lsp_dynamic_workspace_symbols<CR>", opts)
map("n", "<space>q", ":lua require('actions-preview').code_actions()<CR>", opts)

-- Textobjects
map({ "x", "o" }, "af", select_textobject("@function.outer"), opts)
map({ "x", "o" }, "if", select_textobject("@function.inner"), opts)
map({ "x", "o" }, "ac", select_textobject("@class.outer"), opts)
map({ "x", "o" }, "ic", select_textobject("@class.inner"), opts)
map({ "n", "x", "o" }, "]f", goto_next_start("@function.outer"), opts)
map({ "n", "x", "o" }, "[f", goto_previous_start("@function.outer"), opts)
map({ "n", "x", "o" }, "]c", goto_next_start("@class.outer"), opts)
map({ "n", "x", "o" }, "[c", goto_previous_start("@class.outer"), opts)

-- Folds
map("n", "za", ":lua require('ufo').openAllFolds()<CR>", opts)
map("n", "zc", ":lua require('ufo').closeAllFolds()<CR>", opts)
map("n", "<space><space>", ":lua require('fold-cycle').toggle_all()<CR>", opts)

-- Telescope
map("n", "<leader>l", ":Lazy<CR>", opts)
map("n", "<leader>m", ":Mason<CR>", opts)
map("n", "<leader>r", ":Telescope live_grep<CR>", opts)
map("n", "<leader>b", ":Telescope git_branches<CR>", opts)
map("n", "<leader><leader>", ":AutoSession search<CR>", opts)
map("n", "<leader>f", ":Telescope find_files<CR>", opts)
map("n", "<leader>e", ":Telescope diagnostics<CR>", opts)
map("n", "<leader>v", ":VenvSelect<CR>", opts)
map("n", "<leader>t", ":TodoTelescope<CR>", opts)

-- Merge
map("n", "<space>gcc", ":GitConflictChooseOurs<CR>", opts)
map("n", "<space>gci", ":GitConflictChooseTheirs<CR>", opts)
map("n", "<space>gcb", ":GitConflictChooseBoth<CR>", opts)
map("n", "<space>gcn", ":GitConflictNextConflict<CR>", opts)
