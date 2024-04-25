local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  -- install = { colorscheme = { "tokyonight", "catppuccin", "habamax" } },
  checker = { enabled = true, notify = true },
  -- dev = {
  --     path = "~/code/plugins"
  -- },
  ui = {
    border = "rounded",
  },
  performance = {
    rtp = {
      disabled_plugins = {},
    },
  },
})
