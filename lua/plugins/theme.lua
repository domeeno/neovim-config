return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      transparent_background = true,
      term_colors = true,
    },
    priority = 1000
  },
  {
    "folke/tokyonight.nvim",
    opts = {},
    config = function()
      require("tokyonight").setup {
        transparent = true,
        styles = {
          sidebars = "transparent",
          floats = "transparent",
        }
      }
    end
  },
}
