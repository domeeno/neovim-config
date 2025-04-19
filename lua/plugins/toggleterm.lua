return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup {
        size = function(term)
          if term.direction == "horizontal" then
            return 15
          elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
          end
        end,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        terminal_mappings = true,
        persist_size = true,
        persist_mode = true,
      }

      -- Keymaps
      -- <C-t>: toggles the terminal in horizontal or vertical (default terminal)
      vim.keymap.set("n", "<C-t>", function()
        -- This will toggle terminal 1 (default) in horizontal or vertical depending on last used
        vim.cmd("ToggleTerm")
      end, { desc = "Toggle Terminal (default layout)" })

      -- <leader>t: toggle floating terminal
      vim.keymap.set("n", "<leader>t", function()
        require("toggleterm.terminal").Terminal
          :new({ direction = "float" })
          :toggle()
      end, { desc = "Toggle Floating Terminal" })
    end
  }
}

