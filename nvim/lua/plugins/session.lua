return {
  "rmagatti/auto-session",
  lazy = false,
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    suppressed_dirs = { "~/" },
    session_lens = {
      path_display = { "shorten" },
    },
  },
}
