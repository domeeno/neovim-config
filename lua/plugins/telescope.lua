return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "v0.2.0",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require('telescope.builtin')

      -- keymaps
      vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = '[F]ind [F]iles' })
      vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = '[F]ind [F]iles' })
      vim.keymap.set('n', '<leader>sw', builtin.live_grep, { desc = '[F]ind [G]rep' })
      vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[F]ind Existing [B]uffers' })
      vim.keymap.set('n', '<leader>gh', builtin.git_commits, { desc = '[G]it Commit [H]istory' })
      vim.keymap.set('n', '<leader>gb', builtin.git_branches, { desc = '[G]it [B]ranches' })

      -- etc. keymaps
      vim.keymap.set('n', '<leader>ch', builtin.command_history, { desc = '[C]ommand [H]istory' })
      vim.keymap.set('n', '<leader>cs', builtin.colorscheme, { desc = '[C]olor [S]cheme' })

      -- code nav & diagnostics
      vim.keymap.set('n', 'gD', builtin.diagnostics, { desc = '[D]iagnostics', buffer = 0 })
      vim.keymap.set('n', 'gd', builtin.lsp_definitions, { desc = 'Go to [D]efinition' })
      vim.keymap.set('n', 'gi', builtin.lsp_implementations, { desc = 'Go to [I]mpl' })
      vim.keymap.set('n', 'gr', builtin.lsp_references, { desc = 'Go to [R]efs' })
      vim.keymap.set('n', 'gt', builtin.lsp_type_definitions, { desc = 'Go to [T]ype Defs' })
    end
  }
}
