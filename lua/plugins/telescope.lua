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

      -- etc. keymaps
      vim.keymap.set('n', '<leader>ch', builtin.command_history, { desc = '[C]ommand [H]istory' })
      vim.keymap.set('n', '<leader>cs', builtin.colorscheme, { desc = '[C]olor [S]cheme' })

      -- lsp: code nav & diagnostics
      vim.keymap.set('n', 'gD', builtin.diagnostics, { desc = '[D]iagnostics', buffer = 0 })
      vim.keymap.set('n', 'gd', builtin.lsp_definitions, { desc = '[G]o to [D]efinition' })
      vim.keymap.set('n', 'gi', builtin.lsp_implementations, { desc = '[G]o to [I]mplementations' })
      vim.keymap.set('n', 'gr', builtin.lsp_references, { desc = '[G]o to [R]efeferences' })
      vim.keymap.set('n', 'gt', builtin.lsp_type_definitions, { desc = '[G]o to [T]ype Defs' })
      vim.keymap.set('n', '<leader>ds', builtin.lsp_document_symbols, { desc = '[D]ocument [S]ymbols' })
      vim.keymap.set('n', '<leader>ws', builtin.lsp_workspace_symbols, { desc = '[W]orkspace [S]ymbols' })

      -- VCS
      vim.keymap.set('n', '<leader>gh', builtin.git_commits, { desc = '[G]it Commit [H]istory' })
      vim.keymap.set('n', '<leader>gb', builtin.git_branches, { desc = '[G]it [B]ranches' })
      vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = '[G]it [S]tatus' })
    end
  }
}
