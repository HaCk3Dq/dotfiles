return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },

  dependencies = {
    { "mason-org/mason.nvim", build = ":MasonUpdate" },
    "mason-org/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = {
        library = {
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
  },

  config = function()
    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    capabilities.textDocument.foldingRange = { dynamicRegistration = false, lineFoldingOnly = true }

    vim.diagnostic.config({ virtual_text = true, signs = false })
    for type, icon in pairs({ Error = " ", Warn = " ", Hint = "󰌶", Info = " " }) do
      vim.fn.sign_define("DiagnosticSign" .. type, { text = icon, texthl = "DiagnosticSign" .. type })
    end

    local default_on_attach = function(_, bufnr)
      require("lsp_signature").on_attach({ hint_prefix = "💡" }, bufnr)
    end

    mason_lspconfig.setup({
      handlers = {

        function(server)
          lspconfig[server].setup({
            capabilities = capabilities,
            on_attach = default_on_attach,
          })
        end,

        lua_ls = function()
          lspconfig.lua_ls.setup({
            capabilities = capabilities,
            on_attach = default_on_attach,
            settings = {
              Lua = {
                hint = { enable = true, arrayIndex = "Disable" },
                telemetry = { enable = false },
                diagnostics = { globals = { "vim" }, disable = { "undefined-global" } },
                completion = { keywordSnippet = "Replace", callSnippet = "Replace" },
              },
            },
          })
        end,

        pyright = function()
          lspconfig.pyright.setup({
            capabilities = capabilities,
            on_attach = default_on_attach,
            settings = {
              python = {
                analysis = {
                  autoImportCompletions = true,
                  autoSearchPaths = true,
                  diagnosticMode = "workspace",
                },
              },
            },
          })
        end,
      },
    })
  end,
}
