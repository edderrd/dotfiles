local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
	vim.notify("Gitsings not loaded")
	return
end
local function map(mode, lhs, rhs, opts)
	opts = vim.tbl_extend("force", { noremap = true, silent = true }, opts or {})
	vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

-- Navigation
map("n", "<leader>hn", "&diff ? '<leader>hn' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
map("n", "<leader>hN", "&diff ? '<leader>hN' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })

-- Actions
-- map("n", "<leader>gr", ":Gitsigns reset_hunk<CR>")
-- map("v", "<leader>gr", ":Gitsigns reset_hunk<CR>")
-- map("n", "<leader>gS", "<cmd>Gitsigns stage_buffer<CR>")
-- map("n", "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<CR>")
-- map("n", "<leader>gR", "<cmd>Gitsigns reset_buffer<CR>")
map("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>")
map("n", "<leader>gB", '<cmd>lua require"gitsigns".blame_line{full=true}<CR>')
map("n", "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<CR>")
map("n", "<leader>gd", "<cmd>Gitsigns diffthis<CR>")
map("n", "<leader>gD", '<cmd>lua require"gitsigns".diffthis("~")<CR>')
map("n", "<leader>gx", "<cmd>Gitsigns toggle_deleted<CR>")

-- Text object
map("o", "ih", ":<C-U>Gitsigns select_hunk<CR>")
map("x", "ih", ":<C-U>Gitsigns select_hunk<CR>")

gitsigns.setup({
	signs = {
		add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
		change = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
		delete = { hl = "GitSignsDelete", text = "契", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
		topdelete = { hl = "GitSignsDelete", text = "契", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
		changedelete = {
			hl = "GitSignsChange",
			text = "▎",
			numhl = "GitSignsChangeNr",
			linehl = "GitSignsChangeLn",
		},
	},
	signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
	numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
	linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
	word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
	watch_gitdir = {
		interval = 1000,
		follow_files = true,
	},
	attach_to_untracked = true,
	current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
		delay = 1000,
		ignore_whitespace = false,
	},
	current_line_blame_formatter_opts = {
		relative_time = false,
	},
	sign_priority = 6,
	update_debounce = 100,
	status_formatter = nil, -- Use default
	max_file_length = 40000,
	preview_config = {
		-- Options passed to nvim_open_win
		border = "single",
		style = "minimal",
		relative = "cursor",
		row = 0,
		col = 1,
	},
	yadm = {
		enable = false,
	},
})
