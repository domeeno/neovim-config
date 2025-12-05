-- TREESITTER CONFIG

return {
  { 
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup({
        -- keybindings
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<Leader>si", -- (s)election (i)nit,
            node_incremental = "<Leader>sw", -- (s)election up (w) like the games up == 'w'
            scope_incremental = "<Leader>s<Leader>", -- (s)election jump - like jumping space, it's a big select
            node_decremental = "<Leader>ss", -- (s)selection down (s) like the games back == 's'
          },
        },
        -- A list of parser names, or "all" (the listed parsers MUST always be installed)
        ensure_installed = { "c", "cpp", "python", "java", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },

        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        auto_install = true,

        -- List of parsers to ignore installing (or "all")
        ignore_install = { },

        highlight = {
          enable = true,

          -- list of language that will be disabled
          disable = { },
        },

        -- nvim-treesitter/nvim-treesitter-textobjects module (imported below)
        textobjects = {
          select = {
            enable = true,

            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              -- You can optionally set descriptions to the mappings (used in the desc parameter of
              -- nvim_buf_set_keymap) which plugins like which-key display
              ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
              -- You can also use captures from other query groups like `locals.scm`
              ["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
            },
            -- mapping query_strings to modes.
            selection_modes = {
              ['@parameter.outer'] = 'v', -- charwise
              ['@function.outer'] = 'v', -- ('V') if linewise
              ['@class.outer'] = '<c-v>', -- blockwise
            },
            -- If you set this to `true` (default is `false`) then any textobject is
            -- extended to include preceding or succeeding whitespace. 
            include_surrounding_whitespace = true,
          },
        },
      })
    end
  },
  -- add textobjects module to treesitter
  { "nvim-treesitter/nvim-treesitter-textobjects" },
}
