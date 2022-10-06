local status, mason = pcall(require, "mason")
if not status then
  vim.notify("Mason not loaded")
  return
end
local status2, lspconfig = pcall(require, "mason-lspconfig")
if not status2 then
  vim.notify("Mason LSP Config not loaded")
  return
end

mason.setup({})

lspconfig.setup({
  ensure_installed = {
    "sumneko_lua",
    "tailwindcss",
    "eslint_d",
    "prettierd",
    "tsserver",
    "intelephense",
    "jsonls",
  },
})
