return {
  "kyazdani42/nvim-tree.lua",
  -- commit = "9c97e6449b0b0269bd44e1fd4857184dfa57bb4c",
  dependencies = {
    "kyazdani42/nvim-web-devicons",
  },
  event = "VeryLazy",
  config = function()
    require("user.nvim-tree")
  end,
}
