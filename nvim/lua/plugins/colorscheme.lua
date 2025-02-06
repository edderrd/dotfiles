return {
  { "catppuccin/nvim", as = "catppuccin", priority = 1000 },
  {
    "LazyVim/LazyVim",
    opts = function()
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        style = "warm",
      })
      return {
        colorscheme = "catppuccin",
      }
    end,
  },
}
