local status_ok, saga = pcall(require, "lspsaga")
if not status_ok then
  vim.notify("LSP Saga")
  return
end
saga.init_lsp_saga({
  server_filetype_map = {
    typescript = "typescript",
  },
  border_style = "rounded",
  code_action_num_shortcut = true,
  code_action_lightbulb = {
    enable = false,
    enable_in_insert = false,
    cache_code_action = true,
    sign = true,
    update_time = 150,
    sign_priority = 20,
    virtual_text = false,
  },
  symbol_in_winbar = {
    enable = false,
  },
})

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
vim.keymap.set("n", ";e", "<Cmd>Lspsaga diagnostic_jump_next<CR>", {})
vim.keymap.set("n", "gl", "<Cmd>Lspsaga show_cursor_diagnostics<CR>", {})
vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<CR>", opts)
vim.keymap.set("n", "gd", "<Cmd>Lspsaga lsp_finder<CR>", opts)
vim.keymap.set("i", "<C-k>", "<Cmd>Lspsaga signature_help<CR>", opts)
vim.keymap.set("n", "gp", "<Cmd>Lspsaga preview_definition<CR>", opts)
vim.keymap.set("n", "gr", "<Cmd>Lspsaga rename<CR>", opts)
vim.keymap.set("n", "ga", "<Cmd>Lspsaga code_action<CR>", opts)
vim.keymap.set("v", "ga", "<Cmd>Lspsaga range_code_action<CR>", opts)
vim.keymap.set("n", ";o", "<Cmd>LSoutlineToggle<CR>", opts)
