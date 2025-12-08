return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",

    config = function()
      require("CopilotChat").setup({
        model = 'claude-opus-4.5', -- AI model to use
        temperature = 0.2,         -- Lower = focused, higher = creative
        window = {
          layout = 'vertical',     -- 'vertical', 'horizontal', 'float'
          width = 0.4,             -- 50% of screen width
        },
        auto_insert_mode = true,   -- Enter insert mode when opening

        window = {
          layout = 'float',
          width = 80,         -- Fixed width in columns
          height = 20,        -- Fixed height in rows
          border = 'rounded', -- 'single', 'double', 'rounded', 'solid'
          title = '🤖 AI Assistant',
          zindex = 100,       -- Ensure window stays on top
        },

        headers = {
          user = '👤 You',
          assistant = '🤖 Copilot',
          tool = '🔧 Tool',
        },

        separator = '━━',
        auto_fold = true, -- Automatically folds non-assistant messages
      })

      vim.keymap.set('n', '<leader>cc', '<cmd>CopilotChatToggle<cr>', { desc = "Open Copilot Chat" })

      -- In your colorscheme or init.lua
      vim.api.nvim_set_hl(0, 'CopilotChatHeader', { fg = '#7C3AED', bold = true })
      vim.api.nvim_set_hl(0, 'CopilotChatSeparator', { fg = '#374151' })
    end
  },
}
