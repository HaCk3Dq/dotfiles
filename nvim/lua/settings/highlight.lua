_G.C = require("catppuccin.palettes").get_palette("frappe")
_G.U = require("catppuccin.utils.colors")
_G.O = vim.deepcopy(require("catppuccin").default_options)

local set = vim.api.nvim_set_hl

local nord_text = "#D8DEE9"
local nord_string = "#A3BE8C"
local nord_builtin = "#8FBCBB"
local nord_func = "#81A1C1"

local function apply(groups)
  for name, hl in pairs(groups) do
    if hl.style then
      for _, s in ipairs(hl.style) do
        hl[s] = true
      end
      hl.style = nil
    end
    set(0, name, hl)
  end
end

local editor = require("catppuccin.groups.editor").get()
local basic = require("catppuccin.groups.syntax").get()
local tst = require("catppuccin.groups.treesitter").get()
local lsp_groups = require("catppuccin.groups.lsp").get()
local lsp = require("catppuccin.groups.semantic_tokens").get()
local cmp = require("catppuccin.groups.integrations.cmp").get()
local snacks = require("catppuccin.groups.integrations.snacks").get()

basic.String.fg = nord_string

tst["@variable"].fg = nord_text
tst["@function.builtin"].fg = nord_builtin
tst["@constructor.lua"].fg = nord_text
tst["@keyword.function.lua"] = { fg = nord_func }
tst["@property.yaml"] = { fg = nord_text }
lsp["@lsp.type.parameter.dockerfile"] = { fg = nord_text }

lsp["@lsp.mod.global"] = { fg = C.red }

for _, group in ipairs({
  editor,
  basic,
  tst,
  lsp_groups,
  lsp,
  cmp,
  snacks,
}) do
  apply(group)
end

set(0, "NotifyBackground", { bg = "#000000" })
