return {
  "neovim/nvim-lspconfig",
  dependencies = {
      {
          "jose-elias-alvarez/null-ls.nvim",
          {
            "glepnir/lspsaga.nvim",
            branch = "main",
          },
          "MunifTanjim/prettier.nvim",
      },
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "WhoIsSethDaniel/mason-tool-installer.nvim",
      {
          "j-hui/fidget.nvim",
          opts = {
              sources = {
                  ["null-ls"] = {
                      ignore = true
                  }
              }
          },
      },
  },
  event = "VeryLazy",
  config = function ()
      require("user.lsp")
  end
}