return {
  "nvim-telescope/telescope.nvim",
  version = "*",
  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "kyazdani42/nvim-web-devicons",
    "nvim-lua/plenary.nvim",
    "folke/todo-comments.nvim",
  },
  config = function()
    require("telescope").load_extension("session-lens")
    local actions = require("telescope.actions")

    require("telescope").setup({
      pickers = {
        live_grep = { additional_args = { "--hidden" } },
        find_files = { hidden = true },
      },
      defaults = {
        file_ignore_patterns = { ".git/" },
        prompt_prefix = "λ -> ",
        selection_caret = "> ",
        mappings = { i = { ["<esc>"] = actions.close } },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
        },
      },
    })

    require("telescope").load_extension("fzf")
  end,
}
