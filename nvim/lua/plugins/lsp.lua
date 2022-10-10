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
}

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = { "documentation", "detail", "additionalTextEdits" },
}

for _, server in ipairs(servers_with_default_settings) do
  lspconfig[server].setup({
    capabilities = capabilities,

    require('lsp_signature').on_attach({
      bind = true,
      hint_prefix = '💡',
    }, bufnr)

  })
end


lspconfig.sumneko_lua.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
        disable = { 'undefined-global' },
      },
      completion = {
        keywordSnippet = 'Replace',
        callSnippet = 'Replace',
      },
    },
  },
})

