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
	ensure_installed = { "sumneko_lua", "tailwindcss", "eslint_d", "prettierd", "typescript-language-server" },
})

local opts = {
	on_attach = require("user.lsp.handlers").on_attach,
	capabilities = require("user.lsp.handlers").capabilities,
}

lspconfig.setup_handlers({

	function(server)
		if server.name == "jsonls" then
			local jsonls_opts = require("user.lsp.settings.jsonls")
			opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
		end

		if server.name == "sumneko_lua" then
			local sumneko_opts = require("user.lsp.settings.sumneko_lua")
			opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
		end

		server.setup(opts)
	end,
})
