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

      -- keymaps
      vim.keymap.set("n", "<F3>", function() vim.lsp.buf.format { async = true } end,
        { desc = "Format", buffer = bufnr })
      vim.keymap.set("n", "<F4>", vim.lsp.buf.code_action, { desc = "Code Action", buffer = bufnr })
      vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, { desc = "Rename", buffer = bufnr })

      vim.diagnostic.config({
        virtual_text = {
          prefix = "󰃤", -- Could be '●', '▎', 'x'
          spacing = 4,
        },
        virtual_lines = true,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = false,
      })
    end
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
    opts = {}
  }
}
