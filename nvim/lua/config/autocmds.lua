-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Don't show warnings/errors (diagnostics) in markdown files.
-- These come from the `marksman` LSP and the `markdownlint-cli2` linter.
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "markdown.mdx" },
  callback = function(args)
    vim.diagnostic.enable(false, { bufnr = args.buf })
  end,
})
