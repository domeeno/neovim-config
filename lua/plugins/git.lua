return {
  {
    'lewis6991/gitsigns.nvim', -- git integration
    opts = {},
    config = function()
      require('gitsigns').setup()
    end
  }
}
