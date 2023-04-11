local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  vim.notify("Telescope plugin not loaded")
  return
end

local function telescope_buffer_dir()
  return vim.fn.expand("%:p:h")
end

local builtin = require("telescope.builtin")
local actions = require("telescope.actions")
local fb_actions = require("telescope").extensions.file_browser.actions

local _find_files = function()
  builtin.find_files({ hidden = true, preview_title = false, prompt_title = false, results_title = false })
end
local _find_files_desc = { desc = "Find Files" }
vim.keymap.set("n", "<leader>f", _find_files, _find_files_desc)
vim.keymap.set("n", ";f", _find_files, _find_files_desc)

local _search = function()
  builtin.live_grep({
    path_display = { "smart", shorten = { len = 3 } },
    prompt_prefix = "  ",
    -- preview_title = false,
    prompt_title = false,
    results_title = false,
    find_command = { "g", "--files", "--hidden", "--follow", "--smart-case" },
    vimgrep_arguments = {
      "rg",
      "--with-filename",
      "--line-number",
      "--no-heading",
      "--hidden",
      "--column",
      "--smart-case",
    },
  })
end

-- local _search = function()
--   telescope.extensions.live_grep_args.live_grep_args({
--     hidden = true,
--     auto_quoting = true,
--     prompt_prefix = "  ",
--     preview_title = false,
--     prompt_title = false,
--     results_title = false,
--   })
-- end
local _search_desc = { desc = "Search in Files" }
vim.keymap.set("n", "<leader>s", _search, _search_desc)
vim.keymap.set("n", ";s", _search, _search_desc)

vim.keymap.set("n", ";b", function()
  builtin.buffers({ prompt_prefix = " ﬘ ", prompt_title = false, results_title = false })
end, { desc = "Search in buffers" })
vim.keymap.set("n", ";h", function()
  builtin.help_tags({ prompt_prefix = "  ", preview_title = false, prompt_title = false, results_title = false })
end, { desc = "Search Help Tags" })

local _git = function()
  builtin.git_status({ prompt_prefix = "  ", prompt_title = false, results_title = false })
end
local _git_desc = { desc = "Git File Search" }
vim.keymap.set("n", ";g", _git, _git_desc)
vim.keymap.set("n", "<leader>l", _git, _git_desc)

local _commands = function()
  builtin.commands({ prompt_prefix = " גּ ", preview_title = false, prompt_title = false, results_title = false })
end
local _commands_desc = { desc = "Search Commands" }
vim.keymap.set("n", ";c", _commands, _commands_desc)
vim.keymap.set("n", "<leader>p", _commands, _commands_desc)
-- vim.keymap.set("n", ";n", function()
--   builtin.extensions.notify.notify({
--     prompt_prefix = "  ",
--     preview_title = false,
--     prompt_title = false,
--     results_title = false,
--   })
-- end)
vim.keymap.set("n", ";d", function()
  builtin.diagnostics({ prompt_prefix = " גּ ", prompt_title = false, results_title = false })
end, { desc = "Search [D]iagnostics" })
vim.keymap.set("n", ";;", function()
  builtin.resume()
end, { desc = "Resume Last Search" })
vim.keymap.set("n", "<leader>k", builtin.keymaps, { desc = "Search [K]eymaps" })
vim.keymap.set("n", ";w", builtin.grep_string, { desc = "Search current [W]ord" })

telescope.setup({
  defaults = {
    prompt_prefix = "   ",
    selection_caret = "  ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    dynamic_preview_title = true,
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
    file_browser = {
      path = "%:p:h",
      cwd = telescope_buffer_dir(),
      theme = "dropdown",
      hijack_netrw = true, -- disables netrw and use telescope-file-browser in its place
      respect_gitignore = false,
      hidden = true,
      grouped = true,
      previewer = false,
      display_stat = false,
      initial_mode = "normal",
      layout_config = { height = 40 },
      prompt_prefix = "   ",
      mappings = {
        -- your custom insert mode mappings
            ["i"] = {
              ["<C-w>"] = function()
            vim.cmd("normal vbd")
          end,
        },
            ["n"] = {
          -- your custom normal mode mappings
              ["N"] = fb_actions.create,
              ["h"] = fb_actions.goto_parent_dir,
              ["/"] = function()
            vim.cmd("startinsert")
          end,
        },
      },
    },
  },
})

pcall(telescope.load_extension, "fzf")

-- telescope.load_extension("file_browser")
-- vim.api.nvim_set_keymap("n", "sf", ":Telescope file_browser<cr>", { silent = true, noremap = true })
