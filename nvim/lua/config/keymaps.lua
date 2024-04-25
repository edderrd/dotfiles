-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", ";w", ":w!<cr>", { silent = true, noremap = true, desc = "Quick Save" })
vim.keymap.set("n", ";qa", ":qa!<cr>", { silent = true, noremap = true, desc = "Quit All" })
vim.keymap.set("n", ";x", ":x!<cr>", { silent = true, noremap = true, desc = "Save and Quit" })
