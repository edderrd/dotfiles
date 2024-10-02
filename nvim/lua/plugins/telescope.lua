return {
  "nvim-telescope/telescope.nvim",
  keys = {
    {
      "<leader>sb",
      ":Telescope buffers<cr>",
      desc = "buffer",
    },
  },
  opts = {
    defaults = {
      path_display = { "truncate" },
      layout_strategy = "horizontal",
      layout_config = { prompt_position = "top" },
      sorting_strategy = "ascending",
    },
  },
}
