local mocha = require("catppuccin.palettes").get_palette("mocha")
local icons = require("lazyvim.config").icons

local bubbles_theme = {
  normal = {
    a = { fg = mocha.base, bg = mocha.peach },
    b = { fg = mocha.text, bg = mocha.surface0 },
    c = { fg = mocha.text },

    z = { fg = mocha.base, bg = mocha.green },
  },

  insert = { a = { fg = mocha.base, bg = mocha.blue } },
  visual = { a = { fg = mocha.base, bg = mocha.mauve } },
  replace = { a = { fg = mocha.base, bg = mocha.red } },

  inactive = {
    a = { fg = mocha.subtext1, bg = mocha.surface0 },
    z = { fg = mocha.subtext1, bg = mocha.surface0 },
  },
}

return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      options = {
        theme = bubbles_theme,
        always_divide_middle = true,
        globalstatus = false,
        component_separators = "",
        section_separators = { left = "", right = "" },
        disabled_filetypes = { statusline = { "dashboard", "alpha", "starter", "NvimTree", "Outline", "ministarter" } },
      },
      sections = {
        lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
        lualine_b = {
          { "filetype", icon_only = true, separator = "", padding = { left = 2, right = 0 } },
          { LazyVim.lualine.pretty_path({ modified_sign = " ●" }) },
        },
        lualine_c = {
          {
            "diagnostics",
            symbols = {
              error = icons.diagnostics.Error,
              warn = icons.diagnostics.Warn,
              info = icons.diagnostics.Info,
              hint = icons.diagnostics.Hint,
            },
          },
          {
            "%w",
            cond = function()
              return vim.wo.previewwindow
            end,
          },
          {
            "%r",
            cond = function()
              return vim.bo.readonly
            end,
          },
          {
            "%q",
            cond = function()
              return vim.bo.buftype == "quickfix"
            end,
          },
        },
        lualine_x = {
          -- stylua: ignore
          {
            function() return "  " .. require("dap").status() end,
            cond = function () return package.loaded["dap"] and require("dap").status() ~= "" end,
            color = function() return { fg = Snacks.util.color("Debug") } end,
          },
          -- stylua: ignore
          {
            function() return require("noice").api.status.mode.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
            color = function() return { fg = Snacks.util.color("Constant") } end,
          },
          -- stylua: ignore
          {
            function() return require("noice").api.status.command.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
            color = function() return { fg = Snacks.util.color("Statement") } end,

          },
          {
            require("lazy.status").updates,
            cond = require("lazy.status").has_updates,
            color = function()
              return { fg = Snacks.util.color("Special") }
            end,
          },
          -- {
          --   "diff",
          --   symbols = {
          --     added = icons.git.added,
          --     modified = icons.git.modified,
          --     removed = icons.git.removed,
          --   },
          --   source = function()
          --     local gitsigns = vim.b.gitsigns_status_dict
          --     if gitsigns then
          --       return {
          --         added = gitsigns.added,
          --         modified = gitsigns.changed,
          --         removed = gitsigns.removed,
          --       }
          --     end
          --   end,
          -- },
        },
        lualine_y = {
          { "branch", separator = "" },
          LazyVim.lualine.root_dir(),
        },
        lualine_z = {
          { "%L%p%%", separator = { right = "" }, padding = { left = 1, right = 1 } },
        },
      },
      inactive_sections = {
        lualine_a = {
          { "filetype", icon_only = true, separator = { left = "" }, padding = { left = 1, right = 0 } },
          { LazyVim.lualine.pretty_path() },
        },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { { "location", separator = { right = "", left = "" }, padding = { left = 0, right = 0 } } },
      },
      tabline = {},
      extensions = { "neo-tree", "lazy" },
    })
  end,
}
