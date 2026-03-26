return {
  "rmagatti/auto-session",
  lazy = false,
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    session_lens = {
      picker_opts = {
        path_display = { "shorten", absolute = true },
      },
    },
    suppressed_dirs = { "~/" },
  },
}
