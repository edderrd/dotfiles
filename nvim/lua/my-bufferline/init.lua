local colors = require "themes/onedark"

require "bufferline".setup {
    options = {
        buffer_close_icon = "",
        modified_icon = "",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 14,
        max_prefix_length = 13,
        tab_size = 20,
        show_tab_indicators = true,
        enforce_regular_tabs = false,
        -- view = "multiwindow",
        show_buffer_close_icons = true,
        separator_style = "thin",
        always_show_bufferline = true,
        mappings = true
    },
    highlights = {
        background = {
            guibg = colors.one_bg,
        },
        close_button = {
            guibg = colors.one_bg,
        },
        separator = {
            guibg = colors.one_bg,
            guifg = colors.background,
        },
        indicator_selected = {
            guibg = colors.red,
            guifg = colors.blue,
        },
        pick_selected = {
            guibg = colors.red,
            guifg = colors.blue,
        }
    }
}

local opt = {silent = true}
local map = vim.api.nvim_set_keymap

-- MAPPINGS
map("n", "<S-t>", [[<Cmd>tabnew<CR>]], opt) -- new tab
map("n", "<S-x>", [[<Cmd>bdelete<CR>]], opt) -- close tab

-- move between tabs
map("n", "<TAB>", [[<Cmd>BufferLineCycleNext<CR>]], opt)
map("n", "<S-TAB>", [[<Cmd>BufferLineCyclePrev<CR>]], opt)
