local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    prompt_prefix = "λ -> ",
    selection_caret = "|> ",
    mappings = {
      i = {
        ["<esc>"] = actions.close,
      },
    },
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    }
  }
}

-- Extensions
require('telescope').load_extension('fzy_native')
require("telescope").load_extension("session-lens")

local M = {}

M.project_files = function()
  local opts = {}
  local ok = pcall(require'telescope.builtin'.git_files, opts)
  if not ok then require'telescope.builtin'.find_files(opts) end
end

return M
