require('mason').setup({})
require('mason-lspconfig').setup()
require('lspkind').init()
local lspconfig = require('lspconfig')

local signs = { Error = '', Warn = '', Hint = '', Info = '' }
for type, icon in pairs(signs) do
	local hl = 'DiagnosticSign' .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local servers_with_default_settings = {
  'pyright',
  'jsonls',
  'dockerls',
  'sumneko_lua',
}

for _, server in ipairs(servers_with_default_settings) do
  lspconfig[server].setup({})
end
