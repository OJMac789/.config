local status, which_key = pcall(require, "which-key")
if not status then
	return
end
local wk = require("which-key")

which_key.setup({

window = {
    border = "double", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0, -- value between 0-100 0 for fully opaque and 100 for fully transparent
  },
layout = {
    height = { min = 5, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 4, -- spacing between columns
    align = "center", -- align columns left, center or right
  },
wk.register({
p = 'which_key_ignore'
}),

wk.register({
["<Space>t"] = { name = "Telescope" },
}),
wk.register({
["<Space>P"] = {name = "Packer"},
}),
wk.register({
["<Space>l"] = {name = "LSP"},
}),
})

