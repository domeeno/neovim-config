return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
      open_mapping = [[<C-`>]],
      hide_numbers = true,
      shade_terminals = true,
      start_in_insert = true,
      insert_mappings = true,
      terminal_mappings = true,
      persist_size = true,
      direction = "float",
      close_on_exit = true,
      float_opts = {
        border = "curved",
        winblend = 0,
      },
    })

    -- Terminal navigation (vim-style in terminal mode)
    function _G.set_terminal_keymaps()
      local opts = { buffer = 0 }
      vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
      vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
      vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
      vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
    end
    vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

    local Terminal = require("toggleterm.terminal").Terminal

    local horizontal = Terminal:new({ direction = "horizontal", count = 2 })
    local vertical = Terminal:new({ direction = "vertical", count = 3 })
    local tab_term = Terminal:new({ direction = "tab", count = 4 })

    vim.keymap.set("n", "<C-`>", "<cmd>ToggleTerm direction=float<CR>", { desc = "Toggle Float Terminal" })
    vim.keymap.set("n", "<C-t>", function() horizontal:toggle() end, { desc = "[T]erminal [H]orizontal" })
    vim.keymap.set("n", "<leader>v", function() vertical:toggle() end, { desc = "[T]erminal [V]ertical" })
    vim.keymap.set("n", "<leader>t", function() tab_term:toggle() end, { desc = "[T]erminal [T]ab" })

    vim.keymap.set("t", "<C-`>", "<cmd>ToggleTerm direction=float<CR>", { desc = "Toggle Float Terminal" })
    vim.keymap.set("t", "<C-t>", "<cmd>ToggleTerm<CR>", { desc = "Toggle current terminal" })
  end,
}
