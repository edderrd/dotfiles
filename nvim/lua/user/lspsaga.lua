local status_ok, lspsaga = pcall(require, "lspsaga")
if not status_ok then
	vim.notify("saga not loaded")
	return
end

lspsaga.setup({
	use_saga_diagnostic_sign = false,
	error_sign = "",
	warn_sign = "",
	hint_sign = "",
	infor_sign = "",
	code_action_icon = "",
	code_action_prompt = {
		enable = false,
	},
})

local map = vim.api.nvim_set_keymap

map("n", "gr", "<cmd>Lspsaga rename<cr>", { silent = true, noremap = true })
map("n", "gx", "<cmd>Lspsaga code_action<cr>", { silent = true, noremap = true })
map("x", "gx", ":<c-u>Lspsaga range_code_action<cr>", { silent = true, noremap = true })
map("n", "K", "<cmd>Lspsaga hover_doc<cr>", { silent = true, noremap = true })
map("n", "go", "<cmd>Lspsaga show_line_diagnostics<cr>", { silent = true, noremap = true })
map("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", { silent = true, noremap = true })
map("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", { silent = true, noremap = true })
