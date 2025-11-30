return {
  {
    "nvim-telescope/telescope.nvim", 
    tag = "v0.2.0",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local telescope = require('telescope')
      local builtin = require('telescope.builtin')

      -- keymaps
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
      vim.keymap.set('n', '<leader>sw', builtin.live_grep, { desc = '[F]ind [G]rep' })
      vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[F]ind Existing [B]uffers' })
      vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = '[G]it [C]ommits' })
      vim.keymap.set('n', '<leader>gb', builtin.git_branches, { desc = '[G]it [B]ranches' })

      -- etc. keymaps
      vim.keymap.set('n', '<leader>ch', builtin.command_history, { desc = '[C]ommand [H]istory' })
      vim.keymap.set('n', '<leader>cs', builtin.colorscheme, { desc = '[C]olor [S]cheme' })
      vim.keymap.set('n', '<leader>ts', builtin.treesitter, { desc = '[T]ree [S]itter' })
    end
  }
}
