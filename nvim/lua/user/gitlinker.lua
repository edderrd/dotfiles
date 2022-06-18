local status_ok, gitlinker = pcall(require, "gitlinker")
if not status_ok then
	vim.notify("Gitlinker plugin not loaded")
	return
end

gitlinker.setup()

-- vim.api.nvim_set_keymap(
-- 	"n",
-- 	"<leader>gB",
-- 	'<cmd>lua require"gitlinker".get_buf_range_url("n", {action_callback = require"gitlinker.actions".open_in_browser})<cr>',
-- 	{ silent = true }
-- )
-- vim.api.nvim_set_keymap(
-- 	"v",
-- 	"<leader>gB",
-- 	'<cmd>lua require"gitlinker".get_buf_range_url("v", {action_callback = require"gitlinker.actions".open_in_browser})<cr>',
-- 	{}
-- )
vim.api.nvim_set_keymap(
	"n",
	"<leader>o",
	'<cmd>lua require"gitlinker".get_buf_range_url("n", {action_callback = require"gitlinker.actions".copy_to_clipboard})<cr>',
	{ silent = true }
)
vim.api.nvim_set_keymap(
	"v",
	"<leader>o",
	'<cmd>lua require"gitlinker".get_buf_range_url("v", {action_callback = require"gitlinker.actions".copy_to_clipboard})<cr>',
	{}
)
