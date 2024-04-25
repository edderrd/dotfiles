local null_ls = require("null-ls")
-- local laravel_actions = require("laravel.code-actions")

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

local sources = {
	code_actions.gitsigns,
	code_actions.refactoring,

	diagnostics.phpstan.with({
		to_temp_file = false,
		method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
	}),
  formatting.eslint_d.with({
      disabled_filetypes = { "php" },
  }),
  formatting.phpcsfixer,
  formatting.black.with({ extra_args = { "--fast" } }),
  formatting.stylua,
	formatting.jq,
  -- formatting.prettier,
}

null_ls.setup({
    sources = sources,
    on_attach = function(client, bufnr)
      if client.supports_method("textDocument/formatting") then

        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            desc = "[LSP] Format",
            callback = function()
                vim.lsp.buf.format({ 
                  bufnr = bufnr, 
                  timeout_ms = 2000,
                  filter = function(client) return client.name ~= "tsserver" end
                })
            end,
        })
        
        -- vim.keymap.set("n", "<Leader>F", function()
        --   vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
        -- end, { buffer = bufnr, desc = "[lsp] format" })
  
        -- -- format on save
        -- vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
        -- vim.api.nvim_create_autocmd(event, {
        --   buffer = bufnr,
        --   group = group,
        --   callback = function()
        --     vim.lsp.buf.format({ bufnr = bufnr, async = async })
        --   end,
        --   desc = "[lsp] format on save",
        -- })
      end
  
    --   if client.supports_method("textDocument/rangeFormatting") then
    --     vim.keymap.set("x", "<Leader>F", function()
    --       vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
    --     end, { buffer = bufnr, desc = "[lsp] format" })
    --   end
    end,
})
