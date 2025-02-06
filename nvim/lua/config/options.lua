-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- vim.opt.winbar = "%=%m %f"

-- allow anywhere clipboard support
vim.opt.clipboard = "unnamedplus"

-- disable popup transparencies
vim.opt.pumblend = 0
vim.opt.winblend = 0

-- use intelephense for php
vim.g.lazyvim_php_lsp = "intelephense"
