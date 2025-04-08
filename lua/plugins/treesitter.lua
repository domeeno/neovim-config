-- There are some really neat parsers, glsl, elixir, graphql
-- To keep it simple, Include only necessary
-- List of supported languages:
-- https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
return { {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "bash",
      "c",
      "cmake",
      "cpp",
      "css",
      "dockerfile",
      "go",
      "gomod",
      "html",
      "http",
      "java",
      "javascript",
      "json",
      "kotlin",
      "lua",
      "make",
      "proto",
      "python",
      "regex",
      "scss",
      "sql",
      "tsx",
      "typescript",
      "vim",
    },
    sync_install = false,
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false
    },
    indent = { enable = true },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn",
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm",
      }
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        ["]f"] = "@function.outer",
        ["]]"] = "@class.outer",
        ["]a"] = "@parameter.inner"
      },
      goto_previous_start = {
        ["[f"] = "@function.outer",
        ["[["] = "@class.outer",
        ["[a"] = "@parameter.outer"
      },
    },
  },
}
}
