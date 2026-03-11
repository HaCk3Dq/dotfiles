return {
  "nvim-lua/plenary.nvim",
  "stevearc/dressing.nvim",
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = { indent = { char = "▏" } } },
  { "windwp/nvim-autopairs", event = "InsertEnter", config = true },
  { "kylechui/nvim-surround", version = "^4.0.0", event = "VeryLazy" },
  "rrethy/vim-illuminate",
  "wsdjeg/vim-fetch", -- Allows nvim file:line
  "kdheepak/lazygit.nvim",
  "williamboman/mason.nvim",
  "xzbdmw/colorful-menu.nvim",
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "xiyaowong/transparent.nvim", priority = 1000 },

  {
    "chrisgrieser/nvim-spider",
    keys = {
      { "w", "<cmd>lua require('spider').motion('w')<CR>", mode = { "n", "o", "x" } },
      { "e", "<cmd>lua require('spider').motion('e')<CR>", mode = { "n", "o", "x" } },
      { "b", "<cmd>lua require('spider').motion('b')<CR>", mode = { "n", "o", "x" } },
      { "ge", "<cmd>lua require('spider').motion('ge')<CR>", mode = { "n", "o", "x" } },
    },
  },

  {
    "levouh/tint.nvim",
    config = function()
      require("tint").setup({})
    end,
  },

  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    config = function()
      require("ufo").setup({
        provider_selector = function()
          return { "lsp", "indent" }
        end,
      })
    end,
  },

  {
    "stevearc/aerial.nvim",
    opts = {},
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },

  {
    "folke/which-key.nvim",
    opts = {
      layout = {
        height = { min = 10, max = 25 },
      },
    },
  },

  {
    "akinsho/git-conflict.nvim",
    version = "*",
    config = function()
      vim.api.nvim_set_hl(0, "GitConflictCurrent", { bg = "#1D3B40" })
      vim.api.nvim_set_hl(0, "GitConflictCurrentLabel", { bg = "#2A7069" })
      vim.api.nvim_set_hl(0, "GitConflictIncoming", { bg = "#2D3450" })
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
    "rcarriga/nvim-notify",
    config = function()
      vim.notify = require("notify")
      require("notify").setup({
        background_colour = "#000000",
        merge_duplicates = true,
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
      { "nvim-telescope/telescope.nvim", version = "*", dependencies = { "nvim-lua/plenary.nvim" } },
    },
    opts = {
      auto_refresh = true,
      path = "~/.virtualenvs/",
      parents = 0,
    },
    config = function()
      require("venv-selector").setup()
    end,
  },

  {
    "numToStr/Comment.nvim",
    opts = {
      ignore = "^$",
    },
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
