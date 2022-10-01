local status, prettier = pcall(require, "prettier")
if not status then
	return
end

-- @see https://github.com/fsouza/prettierd
-- $ npm install -g @fsouza/prettierd

prettier.setup({
	bin = "prettierd",
	filetypes = {
		"css",
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"json",
		"scss",
		"less",
		"yaml",
		"graphql",
	},
})
