return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },

  dependencies = {
    { "mason-org/mason.nvim", build = ":MasonUpdate" },
    "mason-org/mason-lspconfig.nvim",
    "saghen/blink.cmp",
    { "folke/lazydev.nvim", ft = "lua", opts = {} },
  },

  config = function()
    local capabilities =
      require("blink.cmp").get_lsp_capabilities(require("lsp-file-operations").default_capabilities(), true)
    local mason_lspconfig = require("mason-lspconfig")

    vim.diagnostic.config({
      virtual_text = { prefix = "" },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = " ",
          [vim.diagnostic.severity.WARN] = " ",
          [vim.diagnostic.severity.HINT] = "󰌶",
          [vim.diagnostic.severity.INFO] = " ",
        },
      },
    })

    vim.lsp.config("*", {
      capabilities = capabilities,
    })

    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" }, disable = { "undefined-global" } },
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
