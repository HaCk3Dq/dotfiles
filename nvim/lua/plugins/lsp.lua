return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local capabilities = cmp_nvim_lsp.default_capabilities()

    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = " ",
          [vim.diagnostic.severity.WARN] = " ",
          [vim.diagnostic.severity.INFO] = " ",
          [vim.diagnostic.severity.HINT] = "󰌶",
        },
      },
    })
    local signs = { Error = " ", Warn = " ", Hint = "󰌶", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    local default_attach = function(_, bufnr)
      require("lsp_signature").on_attach({
        hint_prefix = "💡",
      }, bufnr)
    end

    mason_lspconfig.setup_handlers({

      function(server_name)
        lspconfig[server_name].setup({
          capabilities = capabilities,
          on_attach = default_attach,
        })
      end,

      ["lua_ls"] = function()
        lspconfig["lua_ls"].setup({
          capabilities = capabilities,
          on_attach = default_attach,
          settings = {
            Lua = {
              hint = {
                enable = true,
                arrayIndex = "Disable",
              },
              telemetry = {
                enable = false,
              },
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
      end,

      ["pyright"] = function()
        lspconfig["pyright"].setup({
          capabilities = capabilities,
          on_attach = default_attach,
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
    })
  end,
}
