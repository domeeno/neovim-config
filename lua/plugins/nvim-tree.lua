return {
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      vim.keymap.set('n', '<leader><leader>', '<cmd>NvimTreeToggle<CR>', { desc = "Toggle Explorer" })
      require("nvim-tree").setup({
        hijack_netrw = true,
        auto_reload_on_write = true
      })
    end
  },

}
