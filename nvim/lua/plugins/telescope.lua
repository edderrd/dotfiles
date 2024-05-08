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
    },
  },
}
