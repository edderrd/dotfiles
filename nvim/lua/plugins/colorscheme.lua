local colorscheme = "onedark"

return {
  "navarasu/onedark.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    local onedark = require("onedark")
    onedark.setup(require("user.colorscheme." .. colorscheme))
    onedark.load()
    -- vim.cmd.colorscheme("onedark")
  end,
}
