return {
  "neovim/nvim-lspconfig",
  opts = {
    diagnostics = {
      underline = true,
      update_in_insert = false,
      virtual_text = {
        spacing = 4,
        source = "if_many",
        prefix = "icons",
      },
      inlay_hints = {
        enabled = true,
        exclude = { "vue" }, -- filetypes for which you don't want to enable inlay hints
      },
      severity_sort = true,
    },
    servers = {
      vtsls = {},
      eslint = {
        -- root_dir = require("lspconfig").util.find_package_json_ancestor,
        root_dir = vim.fs.dirname(vim.fs.find("package.json", { upward = true })[1]), -- WARNING: workarround to find eslint on subpackages
      },
    },
  },
}
