local status_ok, lsp = pcall(require, "lsp-zero")
if not status_ok then
	return
end

local lsp = require('lsp-zero').preset({
  name = 'minimal',
  set_lsp_keymaps = true,
  manage_nvim_cmp = false,
  suggest_lsp_servers = true,
})

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,

})
local signs = {
    Error = " ",
    Warn  = " ",
    Hint  = " ",
    Info  = " "
}

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
end
