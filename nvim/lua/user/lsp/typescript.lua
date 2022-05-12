local status_ok, typescript = pcall(require, "typescript")
if not status_ok then
	vim.notify("LSP Typescript pluging not loaded")
	return
end

typescript.setup({
	disable_commands = false, -- prevent the plugin from creating Vim commands
	disable_formatting = true, -- disable tsserver's formatting capabilities
	debug = false, -- enable debug logging for commands
})
