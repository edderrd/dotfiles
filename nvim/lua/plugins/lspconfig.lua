return {
  "neovim/nvim-lspconfig",
  opts = {
    diagnostics = {
      underline = true,
      virtual_text = false,
    },
    servers = {
      volar = {
        init_options = {
          vue = {
            hybridMode = true,
          },
        },
      },
      vtsls = {},
    },
  },
}
