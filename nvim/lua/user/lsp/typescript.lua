local status_ok, typescript = pcall(require, "typescript")
if not status_ok then
	vim.notify("LSP Typescript pluging not loaded")
	return
end

typescript.setup({})
