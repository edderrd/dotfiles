-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- vim.opt.winbar = "%=%m %f"

-- allow anywhere clipboard support
vim.opt.clipboard = "unnamedplus"

-- disable popup transparencies
vim.opt.pumblend = 0
vim.opt.winblend = 0

-- show window borders
-- vim.o.winborder = "solid"

-- use intelephense for php
vim.g.lazyvim_php_lsp = "intelephense"

-- sets root directly
-- vim.g.root_spec = { "lsp", { ".git", "lua" }, "cwd" } -- original
vim.g.root_spec = { "cwd" }

-- eslint autoformat
vim.g.lazyvim_eslint_auto_format = true
-- vim.g.lazyvim_prettier_needs_config = false
