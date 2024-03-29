local status_ok, feline = pcall(require, "feline")
if not status_ok then
  return
end

local default = {
    colors = require("user.colorscheme.theme.onedark"),
    lsp = require("feline.providers.lsp"),
    lsp_severity = vim.diagnostic.severity,
}

default.icon_styles = {
    default = {
        left = "",
        right = " ",
        main_icon = "  ",
        vi_mode_icon = " ",
        position_icon = " ",
        empty = " ",
    },
    arrow = {
        left = "",
        right = "",
        main_icon = "  ",
        vi_mode_icon = " ",
        position_icon = " ",
        empty = " ",
    },
    block = {
        left = " ",
        right = " ",
        main_icon = "   ",
        vi_mode_icon = "  ",
        position_icon = "  ",
        empty = " ",
    },
    round = {
        left = "",
        right = "",
        main_icon = " 勇",
        vi_mode_icon = " ",
        position_icon = " ",
        empty = " ",
    },
    slant = {
        left = " ",
        right = " ",
        main_icon = "  ",
        vi_mode_icon = " ",
        position_icon = " ",
        empty = " ",
    },
}

-- statusline style
default.statusline_style = default.icon_styles["round"]

-- show short statusline on small screens
default.shortline = false

-- Initialize the components table
default.components = {
    active = {},
}

default.main_icon = {
    provider = default.statusline_style.main_icon,
    left_sep = {
        str = " " .. default.statusline_style.left,
        hl = {
            fg = default.colors.nord_blue,
            bg = "none",
        },
    },
    hl = {
        fg = default.colors.background,
        bg = default.colors.nord_blue,
    },
    right_sep = {
        str = default.statusline_style.right,
        hl = {
            fg = default.colors.nord_blue,
            bg = "none",
        },
    },
}

default.dir_name = {
    provider = function()
      local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
      return "  " .. dir_name .. " "
    end,
    enabled = default.shortline or function(winid)
      return vim.api.nvim_win_get_width(tonumber(winid) or 0) > 60
    end,
    hl = {
        fg = default.colors.grey_fg2,
        bg = default.colors.lightbg2,
    },
    left_sep = {
        str = " " .. default.statusline_style.left,
        hl = {
            fg = default.colors.lightbg2,
            bg = "none",
        },
    },
    right_sep = {
        str = default.statusline_style.right,
        hl = {
            fg = default.colors.lightbg2,
            bg = default.colors.grey,
        },
    },
}

default.file_name = {
    provider = function()
      local filename = vim.fn.expand("%:t")
      local extension = vim.fn.expand("%:e")
      local icon = require("nvim-web-devicons").get_icon(filename, extension)
      if icon == nil then
        --[[ icon = " " ]]
        icon = " "
        return icon
      end

      return " " .. icon .. " " .. filename
    end,
    enabled = default.shortline or function(winid)
      return vim.api.nvim_win_get_width(tonumber(winid) or 0) > 60
    end,
    hl = {
        fg = default.colors.white,
        bg = default.colors.grey,
    },
}

default.file_modified = {
    enabled = default.shortline or function(winid)
      return vim.api.nvim_win_get_width(tonumber(winid) or 0) > 60
    end,
    provider = function()
      local filename = vim.fn.expand("%:t")
      local extension = vim.fn.expand("%:e")
      local icon = require("nvim-web-devicons").get_icon(filename, extension)
      local modified_str
      if icon == nil then
        return " "
      end

      if vim.bo.modified then
        modified_str = " "
      else
        modified_str = " "
      end

      return modified_str
    end,
    hl = {
        fg = default.colors.pink,
        bg = default.colors.grey,
    },
    right_sep = {
        str = default.statusline_style.right,
        hl = { fg = default.colors.grey, bg = default.colors.none },
    },
}

default.diff = {
    add = {
        provider = "git_diff_added",
        enabled = default.shortline or function(winid)
          return vim.api.nvim_win_get_width(tonumber(winid) or 0) > 70
        end,
        hl = {
            fg = default.colors.grey_fg2,
            bg = "NONE",
        },
        icon = "  ",
    },
    change = {
        provider = "git_diff_changed",
        enabled = default.shortline or function(winid)
          return vim.api.nvim_win_get_width(tonumber(winid) or 0) > 70
        end,
        hl = {
            fg = default.colors.grey_fg2,
            bg = "NONE",
        },
        icon = "  ",
    },
    remove = {
        provider = "git_diff_removed",
        enabled = default.shortline or function(winid)
          return vim.api.nvim_win_get_width(tonumber(winid) or 0) > 70
        end,
        hl = {
            fg = default.colors.grey_fg2,
            bg = "NONE",
        },
        icon = "  ",
    },
}

default.git_branch = {
    provider = "git_branch",
    enabled = default.shortline or function(winid)
      return vim.api.nvim_win_get_width(tonumber(winid) or 0) > 70
    end,
    hl = {
        fg = default.colors.grey_fg2,
        bg = "NONE",
    },
    icon = "  ",
}

default.diagnostic = {
    error = {
        provider = "diagnostic_errors",
        enabled = function()
          return default.lsp.diagnostics_exist(default.lsp_severity.ERROR)
        end,

        hl = { fg = default.colors.red },
        icon = "  ",
    },
    warning = {
        provider = "diagnostic_warnings",
        enabled = function()
          return default.lsp.diagnostics_exist(default.lsp_severity.WARN)
        end,
        hl = { fg = default.colors.yellow },
        icon = "  ",
    },
    hint = {
        provider = "diagnostic_hints",
        enabled = function()
          return default.lsp.diagnostics_exist(default.lsp_severity.HINT)
        end,
        hl = { fg = default.colors.grey_fg2 },
        icon = "  ",
    },
    info = {
        provider = "diagnostic_info",
        enabled = function()
          return default.lsp.diagnostics_exist(default.lsp_severity.INFO)
        end,
        hl = { fg = default.colors.green },
        icon = "  ",
    },
}

default.lsp_progress = {
    provider = function()
      local Lsp = vim.lsp.util.get_progress_messages()[1]

      if Lsp then
        local msg = Lsp.message or ""
        local percentage = Lsp.percentage or 0
        local title = Lsp.title or ""
        local spinners = {
            "",
            "",
            "",
        }

        local success_icon = {
            "",
            "",
            "",
        }

        local ms = vim.loop.hrtime() / 1000000
        local frame = math.floor(ms / 120) % #spinners

        if percentage >= 70 then
          return string.format(" %%<%s %s %s (%s%%%%) ", success_icon[frame + 1], title, msg, percentage)
        end

        return string.format(" %%<%s %s %s (%s%%%%) ", spinners[frame + 1], title, msg, percentage)
      end

      return ""
    end,
    enabled = default.shortline or function(winid)
      return vim.api.nvim_win_get_width(tonumber(winid) or 0) > 80
    end,
    hl = { fg = default.colors.green },
}

default.lsp_icon = {
    provider = function()
      if next(vim.lsp.buf_get_clients()) ~= nil then
        return "  LSP"
      else
        return ""
      end
    end,
    enabled = default.shortline or function(winid)
      return vim.api.nvim_win_get_width(tonumber(winid) or 0) > 70
    end,
    hl = { fg = default.colors.grey_fg2, bg = "NONE" },
}

default.mode_colors = {
    ["n"] = { "NORMAL", default.colors.red },
    ["no"] = { "N-PENDING", default.colors.red },
    ["i"] = { "INSERT", default.colors.dark_purple },
    ["ic"] = { "INSERT", default.colors.dark_purple },
    ["t"] = { "TERMINAL", default.colors.green },
    ["v"] = { "VISUAL", default.colors.cyan },
    ["V"] = { "V-LINE", default.colors.cyan },
    [""] = { "V-BLOCK", default.colors.cyan },
    ["R"] = { "REPLACE", default.colors.orange },
    ["Rv"] = { "V-REPLACE", default.colors.orange },
    ["s"] = { "SELECT", default.colors.nord_blue },
    ["S"] = { "S-LINE", default.colors.nord_blue },
    [""] = { "S-BLOCK", default.colors.nord_blue },
    ["c"] = { "COMMAND", default.colors.pink },
    ["cv"] = { "COMMAND", default.colors.pink },
    ["ce"] = { "COMMAND", default.colors.pink },
    ["r"] = { "PROMPT", default.colors.teal },
    ["rm"] = { "MORE", default.colors.teal },
    ["r?"] = { "CONFIRM", default.colors.teal },
    ["!"] = { "SHELL", default.colors.green },
}

default.mode_hl = function()
  return {
      fg = default.mode_colors[vim.fn.mode()][2],
      bg = default.colors.one_bg2,
  }
end

default.empty_space = {
    provider = " " .. default.statusline_style.left,
    hl = {
        fg = default.colors.background,
        bg = default.colors.background,
    },
}

-- this matches the vi mode color
default.empty_spaceColored = {
    provider = default.statusline_style.right,
    hl = function()
      return {
          fg = default.mode_colors[vim.fn.mode()][2],
          bg = "none",
      }
    end,
}

default.mode_icon = {
    provider = " " .. default.statusline_style.vi_mode_icon,
    hl = function()
      return {
          fg = default.colors.background,
          bg = default.mode_colors[vim.fn.mode()][2],
      }
    end,
}

default.mode_name = {
    provider = function()
      return " " .. default.mode_colors[vim.fn.mode()][1] .. " "
    end,
    hl = default.mode_hl,
    left_sep = {
        str = " " .. default.statusline_style.left,
        hl = {
            fg = default.colors.one_bg2,
            bg = "none",
        },
    },
}

default.separator_empty = {
    provider = default.statusline_style.empty,
    enabled = default.shortline or function(winid)
      return vim.api.nvim_win_get_width(tonumber(winid) or 0) > 90
    end,
    hl = {
        fg = default.colors.background,
        bg = "NONE",
    },
}

default.separator_right = {
    provider = default.statusline_style.left,
    enabled = default.shortline or function(winid)
      return vim.api.nvim_win_get_width(tonumber(winid) or 0) > 90
    end,
    hl = {
        fg = default.colors.green,
        bg = "NONE",
    },
}

default.position_icon = {
    provider = " " .. default.statusline_style.position_icon,
    enabled = default.shortline or function(winid)
      return vim.api.nvim_win_get_width(tonumber(winid) or 0) > 90
    end,
    hl = {
        fg = default.colors.black,
        bg = default.colors.green,
    },
}

default.current_line = {
    provider = function()
      local current_line = vim.fn.line(".")
      local total_line = vim.fn.line("$")

      if current_line == 1 then
        return " Top "
      elseif current_line == vim.fn.line("$") then
        return " Bot "
      end
      local result, _ = math.modf((current_line / total_line) * 100)
      return " " .. result .. "%% "
    end,
    enabled = default.shortline or function(winid)
      return vim.api.nvim_win_get_width(tonumber(winid) or 0) > 90
    end,
    hl = {
        fg = default.colors.one_bg,
        bg = default.colors.green,
    },
    right_sep = {
        str = default.statusline_style.right .. " ",
        hl = {
            fg = default.colors.green,
            bg = "none",
        },
    },
}

local function add_table(a, b)
  table.insert(a, b)
end

default.left = {}
default.middle = {}
default.right = {}

-- left
-- add_table(default.left, default.main_icon)
add_table(default.left, default.mode_name)
add_table(default.left, default.mode_icon)
add_table(default.left, default.empty_spaceColored)

add_table(default.left, default.dir_name)
add_table(default.left, default.file_name)
add_table(default.left, default.file_modified)

add_table(default.left, default.diagnostic.error)
add_table(default.left, default.diagnostic.warning)
add_table(default.left, default.diagnostic.hint)
add_table(default.left, default.diagnostic.info)

-- add_table(default.middle, default.lsp_progress)

-- right
-- add_table(default.right, default.lsp_icon)
add_table(default.right, default.diff.add)
add_table(default.right, default.diff.change)
add_table(default.right, default.diff.remove)
add_table(default.right, default.git_branch)
add_table(default.right, default.separator_empty)
add_table(default.right, default.separator_right)
add_table(default.right, default.position_icon)
add_table(default.right, default.current_line)

default.components.active[1] = default.left
default.components.active[2] = default.middle
default.components.active[3] = default.right

-- components are divided in 3 sections
feline.setup({
    theme = {
        -- bg = default.colors.background,
        bg = "NONE",
        fg = default.colors.fg,
    },
    components = default.components,
})
