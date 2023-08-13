local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

require("toggleterm").setup {
  direction = 'float',
  open_mapping = [[<c-q>]],
  on_open = function(term)
    vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<c-\\>", "exit<CR>", { noremap = true, silent = true })
  end,
  close_on_exit = true,
}
local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
