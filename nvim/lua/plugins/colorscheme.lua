return {
  "nordtheme/vim",
  config = function()
    vim.cmd("colorscheme nord")
    vim.api.nvim_set_hl(0, "Folded", { bg = "#22252C" })
  end,
}
