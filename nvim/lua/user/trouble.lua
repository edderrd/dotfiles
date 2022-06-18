local status_ok, trouble = pcall(require, "trouble")
if not status_ok then
	vim.notify("Trouble plugin not loaded")
	return
end

trouble.setup({
	mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
	auto_close = true,
})
