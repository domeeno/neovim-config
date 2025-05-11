return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-ui-select.nvim', -- moved dependency here, instead of separate
    },
    config = function()
      local telescope = require('telescope')
      local builtin = require('telescope.builtin')

      telescope.setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
          }
        }
      })

      telescope.load_extension("ui-select") -- load extension here

      -- Keybindings
      -- vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
      vim.keymap.set('n', '<leader><leader>', builtin.find_files, { desc = '[F]ind [F]iles' })
      vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Search [G]it [F]iles' })
      vim.keymap.set('n', '<leader>sw', builtin.live_grep, { desc = '[F]ind [G]rep' })
      vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = '[F]ind Recently [O]pen files' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = '[F]ind Existing [B]uffers' })
      -- vim.keymap.set('n', '<leader>sw', function()
      --   builtin.grep_string({ search = vim.fn.input("Grep > ") })
      -- end, { desc = '[S]earch [W]ord' })

      -- Bind F4 to code actions with telescope-ui-select
      vim.keymap.set('n', '<F4>', vim.lsp.buf.code_action, { desc = 'LSP Code Actions (F4)' })
    end,
  },
}
