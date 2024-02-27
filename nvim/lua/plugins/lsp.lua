require("mason").setup({})
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "dockerls", "pyright", "jsonls", "ruff", "ruff_lsp", "taplo", "stylua", "yamlls" },
})
require("lspkind").init()
local lspconfig = require("lspconfig")
local null_ls = require("null-ls")

local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local capabilities = require("cmp_nvim_lsp").default_capabilities(basic_capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = { "documentation", "detail", "additionalTextEdits" },
}

vim.cmd([[
  autocmd BufWritePre * lua vim.lsp.buf.format()
  autocmd BufWritePre * lua vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" } }, apply = true })
]])

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.shfmt,
    null_ls.builtins.diagnostics.hadolint,
  },
})

local servers_with_default_settings = {
  "pyright",
  "jsonls",
  "dockerls",
  "ruff_lsp",
  "bashls",
  "taplo",
  "yamlls",
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

lspconfig.pyright.setup({
  settings = {
    pyright = {
      disableOrganizeImports = true,
    },
  },
})
