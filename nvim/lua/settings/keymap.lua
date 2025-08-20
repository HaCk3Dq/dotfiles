local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<F3>", ":set relativenumber!<CR>", opts)
map("n", "<F4>", ":set list!<CR>", opts)
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)
map("n", "<C-\\>", ":Neotree toggle<CR>", opts)
map("n", "<esc>", ":noh<CR>", opts)
map({ "n", "x", "o" }, "m", "%", opts)

-- Buffers
map("n", "J", ":BufferPrevious<CR>", opts)
map("n", "K", ":BufferNext<CR>", opts)
map("n", "<A-j>", ":BufferMovePrevious<CR>", opts)
map("n", "<A-k>", ":BufferMoveNext<CR>", opts)
map("n", "<C-w>", ":BufferClose<CR>", { nowait = true })
map("n", "<S-x>", ":BufferRestore<CR>", opts)

-- Splits
-- TODO: vertical split + resize
map("n", "<F26>", ":vsp<CR>", opts)
map("n", "<A-a>", ":wincmd h<CR>", opts)
map("n", "<A-d>", ":wincmd l<CR>", opts)
map("n", "<A-s>", ":wincmd j<CR>", opts)
map("n", "<A-w>", ":wincmd k<CR>", opts)
map("n", "<C-X>", ":close<CR>", opts)

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
map("n", "<space>s", ":Telescope lsp_document_symbols<CR>", opts)
map("n", "<space>e", ":lua vim.diagnostic.open_float()<CR>", opts)
map("n", "<space>a", ":AerialToggle<CR>", opts)

-- Folds
map("n", "za", ":lua require('ufo').openAllFolds()<CR>", opts)
map("n", "zc", ":lua require('ufo').closeAllFolds()<CR>", opts)
map("n", "<space><space>", "za", opts)

-- Telescope
map("n", "<leader>l", ":Lazy<CR>", opts)
map("n", "<leader>m", ":Mason<CR>", opts)
map("n", "<leader>r", ":Telescope live_grep<CR>", opts)
map("n", "<leader>b", ":Telescope buffers<CR>", opts)
map("n", "<leader><leader>", ":SessionSearch<CR>", opts)
map("n", "<leader>f", ":Telescope find_files<CR>", opts)
map("n", "<leader>e", ":Telescope diagnostics<CR>", opts)
map("n", "<leader>v", ":VenvSelect<CR>", opts)
map("n", "<leader>t", ":TodoTelescope<CR>", opts)
map("n", "<leader>d", ":Telescope aerial<CR>", opts)
map("n", "<leader>n", ":Telescope notify<CR>", opts)

-- DAP
map("n", "<leader>q", ":lua require('dapui').toggle()<CR>", opts)
map("n", "<F5>", ":lua require('dap').continue()<CR>", opts)
map("n", "<F6>", ":lua require('dap').step_over()<CR>", opts)
map("n", "<F7>", ":lua require('dap').step_into()<CR>", opts)
map("n", "<F8>", ":lua require('dap').step_out()<CR>", opts)
map("n", "<F9>", ":lua require('dap').toggle_breakpoint()<CR>", opts)
map("n", "<F10>", ":lua require('telescope').extensions.dap.list_breakpoints()<CR>", opts)
map("n", "<F11>", ":lua require('telescope').extensions.dap.commands()<CR>", opts)
map("n", "<F12>", ":lua require('dap').clear_breakpoints()<CR>", opts)

-- Merge
map("n", "<space>gcc", ":GitConflictChooseOurs<CR>", opts)
map("n", "<space>gci", ":GitConflictChooseTheirs<CR>", opts)
map("n", "<space>gcb", ":GitConflictChooseBoth<CR>", opts)
map("n", "<space>gcn", ":GitConflictChooseNone<CR>", opts)
