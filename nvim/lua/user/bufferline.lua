local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
	return
end

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map("n", "<leader>,", ":BufferLineCyclePrev<CR>", opts)
map("n", "<leader>.", ":BufferLineCycleNext<CR>", opts)
-- Close buffer
map("n", "<leader>c", ":bdelete<CR>", opts)

-- go directly to tab
map("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>", opts)
map("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>", opts)
map("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>", opts)
map("n", "<leader>4", ":BufferLineGoToBuffer 4<CR>", opts)
map("n", "<leader>5", ":BufferLineGoToBuffer 5<CR>", opts)
map("n", "<leader>6", ":BufferLineGoToBuffer 6<CR>", opts)
map("n", "<leader>7", ":BufferLineGoToBuffer 7<CR>", opts)
map("n", "<leader>8", ":BufferLineGoToBuffer 8<CR>", opts)
map("n", "<leader>9", ":BufferLineGoToBuffer 9<CR>", opts)

bufferline.setup({
	options = {
		numbers = "none", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
		close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
		right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
		left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
		middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
		indicator_icon = "▎",
		buffer_close_icon = "",
		modified_icon = "●",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		max_name_length = 30,
		max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
		tab_size = 21,
		diagnostics = false, -- | "nvim_lsp" | "coc",
		diagnostics_update_in_insert = false,
		offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
		show_buffer_icons = true,
		show_buffer_close_icons = true,
		show_close_icon = true,
		show_tab_indicators = true,
		persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
		separator_style = "thin", -- | "thick" | "thin" | { 'any', 'any' },
		enforce_regular_tabs = true,
		always_show_bufferline = false,
		custom_filter = function(buf_number)
			if vim.fn.bufname(buf_number) ~= "defx" then
				return true
			end
			-- filter out filetypes you don't want to see
			local present_type, type = pcall(function()
				return vim.api.nvim_buf_get_var(buf_number, "term_type")
			end)

			if present_type then
				if type == "vert" then
					return false
				elseif type == "hori" then
					return false
				end
				return true
			end

			return true
			-- filter out by buffer name
		end,
	},
	highlights = {
		fill = {
			guifg = { attribute = "fg", highlight = "#ff0000" },
			guibg = { attribute = "bg", highlight = "TabLine" },
		},
		background = {
			guifg = { attribute = "fg", highlight = "TabLine" },
			guibg = { attribute = "bg", highlight = "TabLine" },
		},

		-- buffer_selected = {
		--   guifg = {attribute='fg',highlight='#ff0000'},
		--   guibg = {attribute='bg',highlight='#0000ff'},
		--   gui = 'none'
		--   },
		buffer_visible = {
			guifg = { attribute = "fg", highlight = "TabLine" },
			guibg = { attribute = "bg", highlight = "TabLine" },
		},

		close_button = {
			guifg = { attribute = "fg", highlight = "TabLine" },
			guibg = { attribute = "bg", highlight = "TabLine" },
		},
		close_button_visible = {
			guifg = { attribute = "fg", highlight = "TabLine" },
			guibg = { attribute = "bg", highlight = "TabLine" },
		},
		-- close_button_selected = {
		--   guifg = {attribute='fg',highlight='TabLineSel'},
		--   guibg ={attribute='bg',highlight='TabLineSel'}
		--   },

		tab_selected = {
			guifg = { attribute = "fg", highlight = "Normal" },
			guibg = { attribute = "bg", highlight = "Normal" },
		},
		tab = {
			guifg = { attribute = "fg", highlight = "TabLine" },
			guibg = { attribute = "bg", highlight = "TabLine" },
		},
		tab_close = {
			-- guifg = {attribute='fg',highlight='LspDiagnosticsDefaultError'},
			guifg = { attribute = "fg", highlight = "TabLineSel" },
			guibg = { attribute = "bg", highlight = "Normal" },
		},

		duplicate_selected = {
			guifg = { attribute = "fg", highlight = "TabLineSel" },
			guibg = { attribute = "bg", highlight = "TabLineSel" },
			gui = "italic",
		},
		duplicate_visible = {
			guifg = { attribute = "fg", highlight = "TabLine" },
			guibg = { attribute = "bg", highlight = "TabLine" },
			gui = "italic",
		},
		duplicate = {
			guifg = { attribute = "fg", highlight = "TabLine" },
			guibg = { attribute = "bg", highlight = "TabLine" },
			gui = "italic",
		},

		modified = {
			guifg = { attribute = "fg", highlight = "TabLine" },
			guibg = { attribute = "bg", highlight = "TabLine" },
		},
		modified_selected = {
			guifg = { attribute = "fg", highlight = "Normal" },
			guibg = { attribute = "bg", highlight = "Normal" },
		},
		modified_visible = {
			guifg = { attribute = "fg", highlight = "TabLine" },
			guibg = { attribute = "bg", highlight = "TabLine" },
		},

		separator = {
			guifg = { attribute = "bg", highlight = "TabLine" },
			guibg = { attribute = "bg", highlight = "TabLine" },
		},
		separator_selected = {
			guifg = { attribute = "bg", highlight = "Normal" },
			guibg = { attribute = "bg", highlight = "Normal" },
		},
		-- separator_visible = {
		--   guifg = {attribute='bg',highlight='TabLine'},
		--   guibg = {attribute='bg',highlight='TabLine'}
		--   },
		indicator_selected = {
			guifg = { attribute = "fg", highlight = "LspDiagnosticsDefaultHint" },
			guibg = { attribute = "bg", highlight = "Normal" },
		},
	},
})
