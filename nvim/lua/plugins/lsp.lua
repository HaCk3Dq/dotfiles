require("mason").setup({})
require("mason-lspconfig").setup()
require("lspkind").init()
local lspconfig = require("lspconfig")
local null_ls = require("null-ls")

require("swenv").setup({
  get_venvs = function(venvs_path)
    return require("swenv.api").get_venvs(venvs_path)
  end,
  venvs_path = vim.fn.expand("~/.virtualenvs"),
  post_set_venv = nil,
})

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.autopep8,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.beautysh,
  },
})

vim.cmd([[
  autocmd BufWritePre * lua vim.lsp.buf.format()
]])

local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local servers_with_default_settings = {
  "pyright",
  "jsonls",
  "dockerls",
  "yamlls",
}

local capabilities = require("cmp_nvim_lsp").default_capabilities(basic_capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = { "documentation", "detail", "additionalTextEdits" },
}

for _, server in ipairs(servers_with_default_settings) do
  lspconfig[server].setup({
    capabilities = capabilities,
    require("lsp_signature").on_attach({
      bind = true,
      hint_prefix = "💡",
    }, bufnr),
  })
end

lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
        disable = { "undefined-global" },
      },
      completion = {
        keywordSnippet = "Replace",
        callSnippet = "Replace",
      },
    },
  },
})
