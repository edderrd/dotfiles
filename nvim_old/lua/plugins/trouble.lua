return {
  "folke/trouble.nvim",
  dependencies = {
    "kyazdani42/nvim-web-devicons",
  },
  event = "VeryLazy",
  config = function()
    require("user.trouble")
  end
}