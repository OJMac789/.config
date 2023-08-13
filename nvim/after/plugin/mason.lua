local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

local status_ok, mason = pcall(require, "mason-lspconfig")
if not status_ok then
	return
end

require("mason").setup()
require("mason-lspconfig").setup {

ensure_installed = { "lua_ls", "bashls", "vimls", "tsserver", "jedi_language_server" },

}
