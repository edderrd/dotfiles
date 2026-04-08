-- If you have issues with nvim crashing see this comment https://github.com/folke/noice.nvim/issues/1188#issuecomment-3891641503
return {
  "folke/noice.nvim",
  event = "VeryLazy",
  enabled = true,
  opts = {
    presets = {
      bottom_search = true,
      command_palette = false,
      long_message_to_split = true,
    },
  },
}
