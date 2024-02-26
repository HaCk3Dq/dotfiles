local function venv()
  local fullPath = require("venv-selector").get_active_venv()
  if not fullPath then
    return ""
  end
  return string.match(fullPath, "[^/\\]+$")
end

require("lualine").setup({
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff", "diagnostics" },
    lualine_c = { "filename" },
    lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_y = {
      {
        venv,
        icon = "",
        color = { fg = "#FFD43B" },
      },
    },
    lualine_z = {},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
})
