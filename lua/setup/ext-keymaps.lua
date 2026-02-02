require("setup/helpers")

vim.keymap.set("n", "<C-t>", function()
  Open_working_dir(Hsplit_terminal)
end, { desc = "Open [T]erminal in current file's directory" })

vim.keymap.set("n", "<C-x>", function()
  Execute(Hsplit_terminal)
end, { desc = "Run project in terminal" })

vim.keymap.set("n", "<leader>t", function()
  Tab_terminal()
end, { desc = "New [T]ab Terminal" })

vim.keymap.set("n", "<leader>x", function()
  Execute(Tab_terminal)
end, { desc = "E[x]ecute current file" })
