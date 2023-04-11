local M = {}

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
    return
end

vim.cmd([[nnoremap <silent>sf :NvimTreeToggle<CR>]])

local tree_cb = nvim_tree_config.nvim_tree_callback

-- live grep using Telescope inside the current directory under
-- the cursor (or the parent directory of the current file)
function M.grep_at_current_tree_node()
    vim.notify("called!!!!!")
    local node = require("nvim-tree.lib").get_node_at_cursor()
    if not node then
        return
    end
    require("telescope.builtin").live_grep({ search_dirs = { node.absolute_path } })
end

nvim_tree.setup({
    auto_reload_on_write = true,
    disable_netrw = false,
    hijack_netrw = false,
    hijack_unnamed_buffer_when_opening = false,
    open_on_setup = false,
    open_on_setup_file = false,
    open_on_tab = false,
    hijack_cursor = false,
    update_cwd = false,
    filesystem_watchers = {
        enable = true,
    },
    diagnostics = {
        enable = false,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {},
    },
    system_open = {
        cmd = nil,
        args = {},
    },
    filters = {
        dotfiles = false,
        custom = {
            -- ".git",
        },
    },
    git = {
        enable = true,
        ignore = true,
        timeout = 500,
    },
    view = {
        adaptive_size = true,
        hide_root_folder = true,
        side = "left",
        signcolumn = "yes",
        mappings = {
            custom_only = false,
            list = {
                { key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
                { key = "h",                  cb = tree_cb("close_node") },
                { key = "v",                  cb = tree_cb("vsplit") },
                {
                    key = { "F" },
                    -- cb = ":lua require'user.nvim-tree'.grep_at_current_tree_node()<CR>",
                    cb = tree_cb("grep_at_current_tree_node"),
                    mode = "n",
                },
            },
        },
        number = false,
        relativenumber = false,
    },
    trash = {
        cmd = "trash",
        require_confirm = true,
    },
    -- disable_window_picker = 0,
    -- root_folder_modifier = ":t",
    actions = {
        open_file = {
            quit_on_open = true,
            window_picker = {
                enable = false,
            },
        },
    },
    renderer = {
        highlight_git = false,
        icons = {
            glyphs = {
                default = "",
                -- default = "",
                symlink = "",
                git = {
                    unstaged = "",
                    staged = "✓",
                    -- staged = "S",
                    unmerged = "",
                    renamed = "➜",
                    deleted = "",
                    -- untracked = "U",
                    untracked = "﯂",
                    ignored = "◌",
                },
                folder = {
                    default = "",
                    empty = "",
                    empty_open = "",
                    open = "",
                    symlink = "",
                    symlink_open = "",
                    arrow_open = "",
                    arrow_closed = "",
                },
            },
        },
    },
})

-- disable border
-- vim.cmd([[highlight WinSeparator guifg=NONE guibg=NONE ]])
-- local colors = require('user.colorscheme.theme.onedark')
-- vim.api.nvim_command(string.format("highlight WinSeparator guifg=%s guibg=%s", colors.background, colors.background))

return M
