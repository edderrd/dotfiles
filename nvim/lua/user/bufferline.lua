local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local colors = require("user.colorscheme.theme.onedark")

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
  highlights = {
    buffer_selected = {
      fg = colors.white,
      italic = false,
    },
    fill = {
      bg = colors.tab_bg,
    },
    separator = {
      fg = colors.tab_bg,
    },
    separator_selected = {
      fg = colors.tab_bg,
    },
    error = {
      italic = false,
    },
  },
  options = {
    --[[ mode = "tabs", ]]
    max_name_length = 30,
    max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
    tab_size = 21,
    offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
    separator_style = "slant", -- | "slant" | "thick" | "thin" | { 'any', 'any' },
    always_show_bufferline = false,
    show_close_icon = false,
    show_tab_indicators = false,
    show_buffer_icons = true,
    show_buffer_close_icons = true,
    indicator = {
      style = "none", -- 'icon' | 'underline' | 'none',
    },
    hover = {
      enabled = true,
      delay = 200,
      reveal = { "close" },
    },
    enforce_regular_tabs = false,
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(_, _, diagnostics_dict, _)
      local s = " "
      for e, n in pairs(diagnostics_dict) do
        local sym = e == "error" and " " or (e == "warning" and " " or "")
        s = s .. n .. sym
      end
      return s
    end,
    custom_filter = function(buf_number)
      if vim.fn.bufname(buf_number) ~= "NvimTree" then
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
})
