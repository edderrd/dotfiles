local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	vim.notify("LSP Installer plugin not loaded")
	return
end

lsp_installer.setup({})
