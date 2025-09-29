_G.C = require("catppuccin.palettes").get_palette("frappe")
_G.U = require("catppuccin.utils.colors")
_G.O = {
  styles = {
    comments = {},
    conditionals = {},
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
}

local function normalize_style(hl)
  if hl.style then
    for _, s in ipairs(hl.style) do
      hl[s] = true
    end
    hl.style = nil
  end
  return hl
end

local set = vim.api.nvim_set_hl

local nord_text = "#D8DEE9"
local nord_string = "#A3BE8C"
local nord_builtin = "#8FBCBB"
local nord_func = "#81A1C1"

local basic = require("catppuccin.groups.syntax").get()
local cmp = require("catppuccin.groups.integrations.cmp").get()
local lsp = require("catppuccin.groups.semantic_tokens").get()
local tst = require("catppuccin.groups.treesitter").get()

basic.String.fg = nord_string

tst["@variable"].fg = nord_text
tst["@function.builtin"].fg = nord_builtin
tst["@constructor.lua"].fg = nord_text
tst["@keyword.function.lua"] = { fg = nord_func }
tst["@property.yaml"] = { fg = nord_text }

lsp["@lsp.type.parameter.dockerfile"] = { fg = nord_text }

for _, group in ipairs({ basic, tst, lsp, cmp }) do
  for name, hl in pairs(group) do
    set(0, name, normalize_style(hl))
  end
end
