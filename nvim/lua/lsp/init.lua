local nvim_lsp = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require('lspkind').init()
require('nvim-autopairs').setup{}

-- Diagnostics symbols for display in the sign column.
local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
vim.cmd('setlocal omnifunc=v:lua.vim.lsp.omnifunc')

require'lspconfig'.html.setup {
  filetypes = {"html", "eruby"},
  capabilities = capabilities,
}
require'lspconfig'.cssls.setup{
  capabilities = capabilities,
}
require'lspconfig'.dockerls.setup{}
require'lspconfig'.jsonls.setup{
  commands = {
    Format = {
      function()
        vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
      end
    }
  }
}
require'lspconfig'.yamlls.setup{}
require'lspconfig'.vimls.setup{}
require'lspconfig'.pyright.setup{}

