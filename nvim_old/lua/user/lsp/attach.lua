local filetype_attach = setmetatable({}, {
  __index = function()
    return function()
    end
  end,
})
return function(client, bufnr)
  local filetype = vim.api.nvim_buf_get_option(0, "filetype")
  -- keymaps for lsp
  -- vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
  vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, { buffer = 0 })
  -- vim.keymap.set("i", "<c-h>", vim.lsp.buf.signature_help, { buffer = 0 })
  vim.keymap.set("n", "<leader>vo", ":LspRestart<cr>", { noremap = true })
  -- vim.keymap.set({ "n", "v" }, "<leader>vca", vim.lsp.buf.code_action, {})
  -- vim.keymap.set("n", "<leader>vf", function()
  -- 	return vim.lsp.buf.format({ async = true })
  -- end, {})

  vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"

  -- Attach any filetype specific options to the client
  filetype_attach[filetype](client, bufnr)
end

