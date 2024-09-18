return {
  "nvim-lua/plenary.nvim",
  "folke/which-key.nvim",
  "stevearc/dressing.nvim",
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = { indent = { char = "▏" } } },
  { "windwp/nvim-autopairs", event = "InsertEnter", config = true },
  { "kylechui/nvim-surround", event = { "BufReadPre", "BufNewFile" }, version = "*", config = true },
  "rrethy/vim-illuminate",
  "wsdjeg/vim-fetch", -- Allows nvim file:line
  "kdheepak/lazygit.nvim",
  "williamboman/mason.nvim",
  "xiyaowong/transparent.nvim",

  {
    "akinsho/git-conflict.nvim",
    version = "*",
    config = function()
      vim.api.nvim_set_hl(0, "GitConflictCurrent", { bg = "#1D3B40" })
      vim.api.nvim_set_hl(0, "GitConflictCurrentLabel", { bg = "#2A7069" })
      vim.api.nvim_set_hl(0, "GitConflictIncoming", { bg = "#1D3450" })
      vim.api.nvim_set_hl(0, "GitConflictIncomingLabel", { bg = "#2A5F92" })
      vim.api.nvim_set_hl(0, "GitConflictAncestor", { bg = "#1E1E1E" })
      vim.api.nvim_set_hl(0, "GitConflictAncestorLabel", { bg = "#282A34" })

      require("git-conflict").setup({
        default_mappings = false,
        list_opener = "copen",
        debug = false,
        disable_diagnostics = true,
        highlights = {
          current = "GitConflictCurrent",
          incoming = "GitConflictIncoming",
          ancestor = "GitConflictAncestor",
        },
      })
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
    },
  },

  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },

  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {},
    config = function(_, opts)
      require("lsp_signature").setup(opts)
    end,
  },

  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "mfussenegger/nvim-dap",
      "mfussenegger/nvim-dap-python",
      { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
    },
    lazy = false,
    branch = "regexp",
    opts = {
      auto_refresh = true,
      path = "~/.virtualenvs/",
      parents = 0,
      dap_enabled = true,
    },
    config = function()
      require("venv-selector").setup()
    end,
  },

  {
    "b3nj5m1n/kommentary",
    config = function()
      require("kommentary.config").configure_language("default", { prefer_single_line_comments = true })
    end,
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("todo-comments").setup()
    end,
  },

  {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup({})
    end,
  },

  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({
        filetypes = { "*" },
        user_default_options = {
          RGB = true,
          RRGGBB = true,
          css = true,
          names = false,
        },
      })
    end,
  },
}
