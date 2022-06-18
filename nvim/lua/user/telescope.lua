local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	vim.notify("Telescope plugin not loaded")
	return
end

vim.cmd([[
" nnoremap <leader>f <cmd>lua require('telescope.builtin').find_files({ find_command = { "rg", "--files", "--hidden", "--follow" }, hidden = true, preview_title = false, prompt_title = false, results_title = false })<cr>
nnoremap <leader>f <cmd>lua require('telescope.builtin').find_files({  hidden = true, preview_title = false, prompt_title = false, results_title = false })<cr>
nnoremap <leader>s <cmd>lua require('telescope.builtin').live_grep({ prompt_prefix = "  ", preview_title = false, prompt_title = false, results_title = false, find_command = { "rg", "--files", "--hidden", "--follow", "--smart-case" } })<cr>
nnoremap <leader>s <cmd>lua require('telescope.builtin').live_grep({ prompt_prefix = "  ", preview_title = false, prompt_title = false, results_title = false })<cr>
noremap <leader>b <cmd>lua require('telescope.builtin').buffers({ prompt_prefix = " ﬘ ", preview_title = false, prompt_title = false, results_title = false })<cr>
nnoremap <leader>H <cmd>lua require('telescope.builtin').help_tags({ prompt_prefix = "  ", preview_title = false, prompt_title = false, results_title = false })<cr>
nnoremap <leader>l <cmd>lua require('telescope.builtin').git_status({ prompt_prefix = "  ", preview_title = false, prompt_title = false, results_title = false })<cr>
nnoremap <leader>p <cmd>lua require('telescope.builtin').commands({ prompt_prefix = " גּ ", preview_title = false, prompt_title = false, results_title = false })<cr>
" nnoremap <leader>e <cmd>lua require('telescope.builtin').diagnostics({ prompt_prefix = " גּ ", preview_title = false, prompt_title = false, results_title = false })<cr>
nnoremap <leader>n <cmd>lua require('telescope').extensions.notify.notify({ prompt_prefix = "  ", preview_title = false, prompt_title = false, results_title = false })<cr>
]])

local actions = require("telescope.actions")

telescope.setup({
	defaults = {
		prompt_prefix = "   ",
		selection_caret = "  ",
		entry_prefix = "  ",
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "ascending",
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				prompt_position = "top",
				preview_width = 0.55,
				results_width = 0.8,
			},
			vertical = {
				mirror = false,
			},
			width = 0.87,
			height = 0.80,
			preview_cutoff = 120,
		},
		find_files = {
			hidden = true,
		},
		file_sorter = require("telescope.sorters").get_fuzzy_file,
		-- file_ignore_patterns = { "node_modules", "^.git/*", "package-lock.json" },
		file_ignore_patterns = {
			"dist/.*",
			"%.git/.*",
			"%.vim/.*",
			"node_modules/.*",
			"%.idea/.*",
			"%.vscode/.*",
			"%.history/.*",
			"%package-lock.json",
		},
		generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
		path_display = { "truncate" },
		-- winblend = 6,
		border = {},
		-- borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		color_devicons = true,
		use_less = true,
		set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
		-- Developer configurations: Not meant for general override
		buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
		mappings = {
			n = {
				["q"] = actions.close,
				["<esc>"] = actions.close,
				["<CR>"] = actions.select_default,
				["<C-x>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
				["<C-t>"] = actions.select_tab,

				["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
				["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
				["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
				["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

				["j"] = actions.move_selection_next,
				["k"] = actions.move_selection_previous,
				["H"] = actions.move_to_top,
				["M"] = actions.move_to_middle,
				["L"] = actions.move_to_bottom,

				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,
				["gg"] = actions.move_to_top,
				["G"] = actions.move_to_bottom,

				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,

				["<Pagep>"] = actions.results_scrolling_up,
				["<PageDown>"] = actions.results_scrolling_down,

				["?"] = actions.which_key,
			},
			i = {
				["<C-n>"] = actions.cycle_history_next,
				["<C-p>"] = actions.cycle_history_prev,

				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,

				["<C-c>"] = actions.close,

				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,

				["<CR>"] = actions.select_default,
				["<C-x>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
				["<C-t>"] = actions.select_tab,

				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,

				["<PageUp>"] = actions.results_scrolling_up,
				["<PageDown>"] = actions.results_scrolling_down,

				["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
				["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
				["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
				["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
				["<C-l>"] = actions.complete_tag,
				["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
			},
		},
	},
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({
				-- options here
			}),
		},
	},
})

telescope.load_extension("ui-select")
