return {
  "rmagatti/auto-session",
  lazy = false,
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("auto-session").setup({
      auto_session_suppress_dirs = { "~/" },
      session_lens = {
        previewer = false,
        load_on_setup = true,
        path_display = { "shorten" },
      },
    })
  end,
}
