local status_ok, todo_comments = pcall(require, "todo-comments")
if not status_ok then
	return
end

todo_comments.setup({})

vim.cmd([[
nnoremap <leader>t <cmd>TodoTelescope<cr>
]])
