return {
  "rcarriga/nvim-notify",
  event = "VeryLazy",
  config = function()
      local notify = require("notify")
      -- this for transparency
      notify.setup({})
      -- this overwrites the vim notify function
      vim.notify = notify.notify
  end
}