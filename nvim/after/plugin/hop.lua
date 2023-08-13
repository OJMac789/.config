local status_ok, hop = pcall(require, "hop")
if not status_ok then
	return
end
require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }

vim.cmd("hi HopNextKey guifg=#50fa7b")
vim.cmd("hi HopNextKey1 guifg=#50fa7b")
vim.cmd("hi HopNextKey2 guifg=#50fa7b")

