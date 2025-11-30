return {
  { 
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup({
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
      })
    end
  },
}
