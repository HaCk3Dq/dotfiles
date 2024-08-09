return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_tool_installer = require("mason-tool-installer")
    local mason_lspconfig = require("mason-lspconfig")

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      ensure_installed = {
        "lua_ls",
        "dockerls",
        "pyright",
        "jsonls",
        "ruff",
        "ruff_lsp",
        "taplo",
        "stylua",
        "yamlls",
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "prettier",
        "stylua",
        "isort",
        "ruff",
        "pylint",
        "shfmt",
        "luacheck",
      },
    })
  end,
}
