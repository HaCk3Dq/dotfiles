return {
  "rrethy/vim-illuminate",
  "wsdjeg/vim-fetch", -- Allows nvim file:line
  "xzbdmw/colorful-menu.nvim",
  "chrisgrieser/nvim-spider",
  { "kdheepak/lazygit.nvim", lazy = true, cmd = { "LazyGit" } },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "xiyaowong/transparent.nvim", priority = 1000 },
  { "windwp/nvim-autopairs", event = "InsertEnter", config = true },
  { "kylechui/nvim-surround", event = "VeryLazy" },
  { "stevearc/aerial.nvim", opts = {} },
  { "folke/todo-comments.nvim", opts = {} },
  { "numToStr/Comment.nvim", opts = { ignore = "^$" } },
  { "linux-cultist/venv-selector.nvim", opts = {} },
  { "ray-x/lsp_signature.nvim", event = "InsertEnter" },
  { "levouh/tint.nvim", config = true },
  { "folke/which-key.nvim", opts = {} },
  { "lewis6991/gitsigns.nvim", config = true },
  { "kevinhwang91/nvim-ufo", dependencies = { "kevinhwang91/promise-async" }, config = true },

  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      input = { enabled = true },
      picker = { enabled = true },
      notifier = { enabled = true },
      indent = {
        enabled = true,
        scope = { hl = "Function" },
      },
      scroll = { enabled = true },
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
