return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },

  dependencies = {
    { "mason-org/mason.nvim", build = ":MasonUpdate" },
    "mason-org/mason-lspconfig.nvim",
    "saghen/blink.cmp",
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
    local mason_lspconfig = require("mason-lspconfig")

    vim.diagnostic.config({ virtual_text = true, signs = false })
    for type, icon in pairs({ Error = " ", Warn = " ", Hint = "󰌶", Info = " " }) do
      vim.fn.sign_define("DiagnosticSign" .. type, { text = icon, texthl = "DiagnosticSign" .. type })
    end

    local default_on_attach = function(_, bufnr)
      require("lsp_signature").on_attach({ hint_prefix = "💡" }, bufnr)
    end

    vim.lsp.config("*", {
      on_attach = default_on_attach,
      capabilities = {
        textDocument = {
          foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true,
          },
        },
      },
    })

    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          hint = { enable = true, arrayIndex = "Disable" },
          telemetry = { enable = false },
          diagnostics = { globals = { "vim" }, disable = { "undefined-global" } },
          completion = { keywordSnippet = "Replace", callSnippet = "Replace" },
        },
      },
    })

    vim.lsp.config("pyright", {
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

    mason_lspconfig.setup({})
  end,
}
