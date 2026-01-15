require("setup/helpers")

vim.keymap.set("n", "<leader>ht", function()
  Open_in(Tab_terminal)
end, { desc = "Open [T]erminal in current file's directory" })

vim.keymap.set("n", "<C-t>", function()
  Open_working_dir(Hsplit_terminal)
end, { desc = "Open [T]erminal in current file's directory" })

vim.keymap.set("n", "<leader>t", function()
  Tab_terminal()
end, { desc = "E[x]ecute current file" })

vim.keymap.set("n", "<leader>x", function()
  Execute(Tab_terminal)
end, { desc = "E[x]ecute current file" })

vim.keymap.set("n", "<leader>xh", function()
  Execute(Hsplit_terminal)
end, { desc = "E[x]ecute [H]orizontal split" })

vim.keymap.set("n", "<leader>xv", function()
  Execute(Vsplit_terminal)
end, { desc = "E[x]ecute [V]ertical split" })
