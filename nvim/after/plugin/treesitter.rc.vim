if !exists('g:loaded_nvim_treesitter')
  echom "Not loaded treesitter"
  finish
endif

set foldexpr=nvim_treesitter#foldexpr()

lua << EOF
require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "tsx",
        "toml",
        "fish",
        "php",
        "json",
        "yaml",
        "swift",
        "html",
        "scss",
        "nix",
        "rust",
        "python",
        "go",
        "jsdoc",
        "c",
        "comment",
        "ruby",
        "bash",
        "svelte",
        "javascript",
        "graphql",
        "vue",
        "lua",
        "css",
    },
    highlight = {
      enable = true,
      -- disable = { "markdown" },
    },
    indent = {
        enable = false,
        disable = {},
    },
    incremental_selection = {
        enable = true,
    },
    textobjects = {
        enable = true,
    },
    autotag = {
        enable = false,
    },
     refactor = {
        highlight_definitions = {
            enable = true
        },
        smart_rename = {
            enable = true,
            keymaps = {
                smart_rename = "grr"
            }
        }
  }
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.used_by = { "javascript", "typescript.tsx" }
EOF
