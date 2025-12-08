require("setup/helpers")

vim.keymap.set("n", "<leader>t", function()
  tab_terminal()
end, { desc = "E[x]ecute current file" })

vim.keymap.set("n", "<leader>x", function()
  execute(tab_terminal)
end, { desc = "E[x]ecute current file" })

vim.keymap.set("n", "<leader>xh", function()
  execute(hsplit_terminal)
end, { desc = "E[x]ecute [H]orizontal split" })

vim.keymap.set("n", "<leader>xv", function()
  execute(vsplit_terminal)
end, { desc = "E[x]ecute [V]ertical split" })
