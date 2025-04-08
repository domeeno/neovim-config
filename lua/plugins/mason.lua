return {
  {"williamboman/mason.nvim", build = ":MasonUpdate", config=true,
  keys = {{ "<leader>m", "<cmd>Mason<cr>", desc = "Mason"}}
},

  {"williamboman/mason-lspconfig.nvim"},
  {"neovim/nvim-lspconfig"},

    {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("lsp.lspsaga")
    end,
  },

   -- Completion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      require("lsp.cmp")
    end,
  },

  -- Additional plugins for code navigation, formatting, keymaps, and debug adapter
  { 'nvim-treesitter/nvim-treesitter' },
  { 'nvim-telescope/telescope.nvim' },
  { 'mfussenegger/nvim-dap' },
  { 'theHamsta/nvim-dap-virtual-text' },
  { 'rcarriga/nvim-dap-ui' },
}

