return {
  {
    "neovim/nvim-lspconfig",
  },
  { 
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
      vim.keymap.set("n", "<leader>m", "<cmd>Mason<cr>", { desc = "[M]ason" })
    end
  },
  { 
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "mason.nvim" },
    config = function()
      require("mason-lspconfig").setup()

      vim.diagnostic.config({
        virtual_text = {
          prefix = "󰃤", -- Could be '●', '▎', 'x'
          spacing = 4,
        },
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = false,
      })
    end
  }
}
