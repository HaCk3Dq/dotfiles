return {
  "nvim-lua/plenary.nvim",
  "folke/which-key.nvim",
  "stevearc/dressing.nvim",
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = { indent = { char = "▏" } } },
  { 'windwp/nvim-autopairs', event = "InsertEnter", config = true },
  { "kylechui/nvim-surround", event = { "BufReadPre", "BufNewFile" }, version = "*", config = true },
}
