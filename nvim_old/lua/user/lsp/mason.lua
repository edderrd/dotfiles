local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")

mason.setup({
  ui = {
    border = "rounded",
  },
})

mason_lspconfig.setup({
  ensure_installed = require("user.lsp.servers"),
})

require("mason-tool-installer").setup({
  ensure_installed = require("user.lsp.tools"),
})

local opts = {}

local scan = require("plenary.scandir")
local serverSettings = {}

for _, value in ipairs(scan.scan_dir(vim.loop.os_homedir() .. "/.config/nvim/lua/user/lsp/settings")) do
  local filePath = vim.split(value, "/")
  local serverName = string.gsub(filePath[#filePath], "%.lua", "")
  serverSettings[serverName] = serverName
end

mason_lspconfig.setup_handlers({
  function(server_name)
    if serverSettings[server_name] then
      local settingsOpts = require("user.lsp.settings." .. serverSettings[server_name])
      opts = vim.tbl_deep_extend("force", settingsOpts, opts)
    end
    lspconfig[server_name].setup(opts)
  end,
})
