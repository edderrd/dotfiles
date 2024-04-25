-- LSP configuration

-- install servers and tools
require('user.lsp.mason')
local setups = require("user.lsp.setups")

local lspconfig = require('lspconfig')
require('mason-lspconfig').setup_handlers({
	function (server_name)
		lspconfig[server_name].setup(setups[server_name]())
	end
})

require('user.lsp.null-ls')
require('user.lsp.lspsaga')