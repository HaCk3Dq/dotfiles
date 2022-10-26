local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map("n", "<F3>", ":set relativenumber!<CR>", opts)
map("n", "<F4>", ":set list! list?<CR>", opts)
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)
map("n", "<C-\\>", ":NeoTreeFocusToggle<CR>", opts)

-- Buffers
map("n", "J", ":BufferPrevious<CR>", opts)
map("n", "K", ":BufferNext<CR>", opts)
map("n", "<A-j>", ":BufferMovePrevious<CR>", opts)
map("n", "<A-k>", ":BufferMoveNext<CR>", opts)
map("n", "<C-W>", ":BufferClose<CR>", opts)
map("n", "<A-c>", ":BufferPick<CR>", opts)

-- Splits
map("n", "<F26>", ":vsp<CR>", opts)
map("n", "<S-Left>", ":wincmd h<CR>", opts)
map("n", "<S-Right>", ":wincmd l<CR>", opts)
map("n", "<leader>z", ":TZAtaraxis<CR>", opts)

-- Git
map("n", "<leader>g", ":LazyGit<CR>", opts)

-- LSP
map("n", "<space>d", ":lua vim.lsp.buf.definition()<CR>", opts)
map("n", "<space>h", ":lua vim.lsp.buf.hover()<CR>", opts)
map("n", "<space>r", ":lua vim.lsp.buf.rename()<CR>", opts)
map("n", "<space>u", ":Telescope lsp_references<CR>", opts)

-- Telescope
map("n", "<leader>r", ':lua require("telescope.builtin").live_grep()<CR>', opts)
map("n", "<leader>p", ':lua require("session-lens").search_session()<CR>', opts)
map("n", "<leader>l", ':lua require("telescope.builtin").current_buffer_fuzzy_find()<CR>', opts)
map("n", "<leader>f", ':lua require("plugins.telescope").project_files()<CR>', opts)
map("n", "<leader>e", ":Telescope diagnostics<CR>", opts)
