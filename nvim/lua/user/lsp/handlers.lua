local M = {}

-- TODO: backfill this to template
M.setup = function()
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		-- disable virtual text
		virtual_text = false,
		-- show signs
		signs = {
			active = signs,
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
end

local function lsp_highlight_document(client)
	if client.server_capabilities.documentHighlightProvider then
		vim.api.nvim_exec(
			[[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
			false
		)
	end
end

M.on_attach = function(client)
	if client.name == "tsserver" then
		client.resolved_capabilities.document_formatting = false
		client.server_capabilities.document_formatting = false
	end

	if client.name == "intelephense" then
		client.server_capabilities.document_formatting = false
	end

	if client.name == "sumneko_lua" then
		client.server_capabilities.document_formatting = false
		client.server_capabilities.document_range_formatting = false

		client.server_capabilities.documentFormatProvider = false
	end

	if client.name == "volar" then
		client.server_capabilities.document_formatting = false
	end

	lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
	return
end

local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
	print("LSP Config not loaded")
	return
end

local opts = {
	on_attach = M.on_attach,
	capabilities = capabilities,
}

local scan = require("plenary.scandir")
local serverSettings = {}

for _, value in ipairs(scan.scan_dir(vim.loop.os_homedir() .. "/.config/nvim/lua/user/lsp/settings")) do
	local filePath = vim.split(value, "/")
	local serverName = string.gsub(filePath[#filePath], "%.lua", "")
	serverSettings[serverName] = serverName
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
	print("Mason LSP Config not loaded")
else
	mason_lspconfig.setup_handlers({
		function(server_name)
			if serverSettings[server_name] then
				local settingsOpts = require("user.lsp.settings." .. serverSettings[server_name])
				opts = vim.tbl_deep_extend("force", settingsOpts, opts)
			end
			lspconfig[server_name].setup(opts)
		end,
	})
end

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
