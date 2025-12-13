local set = vim.api.nvim_set_hl

-- Your color palette
local c = {
  blue = "#7aa2f7",
  cyan = "#7dcfff",
  purple = "#bb9af7",
  green = "#9ece6a",
  yellow = "#e0af68",
  orange = "#ff9e64",
  red = "#f7768e",
  fg = "#c0caf5",
}

-- ==============================
-- Popup Window + Preview Colors
-- ==============================

-- Popup menu background
set(0, "BlinkPmenu", { link = "Pmenu" })
-- Selected item
set(0, "BlinkPmenuSelection", { link = "PmenuSel" })
-- Border of completion menu
set(0, "BlinkPmenuBorder", { link = "FloatBorder" })
-- Matching characters highlight
set(0, "BlinkPmenuMatch", { link = "Search" })

-- Documentation (preview) window
set(0, "BlinkCmpDoc", { link = "NormalFloat" })
set(0, "BlinkCmpDocBorder", { link = "FloatBorder" })

-- ==============================
-- Kind Icons (your original file)
-- ==============================

set(0, "BlinkCmpKindText", { fg = c.fg })
set(0, "BlinkCmpKindMethod", { fg = c.blue })
set(0, "BlinkCmpKindFunction", { fg = c.blue })
set(0, "BlinkCmpKindConstructor", { fg = c.orange })
set(0, "BlinkCmpKindField", { fg = c.green })
set(0, "BlinkCmpKindVariable", { fg = c.red })
set(0, "BlinkCmpKindClass", { fg = c.purple })
set(0, "BlinkCmpKindInterface", { fg = c.cyan })
set(0, "BlinkCmpKindModule", { fg = c.yellow })
set(0, "BlinkCmpKindProperty", { fg = c.green })
set(0, "BlinkCmpKindUnit", { fg = c.yellow })
set(0, "BlinkCmpKindValue", { fg = c.orange })
set(0, "BlinkCmpKindEnum", { fg = c.orange })
set(0, "BlinkCmpKindKeyword", { fg = c.purple })
set(0, "BlinkCmpKindSnippet", { fg = c.orange })
set(0, "BlinkCmpKindColor", { fg = c.cyan })
set(0, "BlinkCmpKindFile", { fg = c.blue })
set(0, "BlinkCmpKindReference", { fg = c.yellow })
set(0, "BlinkCmpKindFolder", { fg = c.blue })
set(0, "BlinkCmpKindEnumMember", { fg = c.orange })
set(0, "BlinkCmpKindConstant", { fg = c.red })
set(0, "BlinkCmpKindStruct", { fg = c.cyan })
set(0, "BlinkCmpKindEvent", { fg = c.yellow })
set(0, "BlinkCmpKindOperator", { fg = c.green })
set(0, "BlinkCmpKindTypeParameter", { fg = c.purple })
