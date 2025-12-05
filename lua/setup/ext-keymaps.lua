-- keymaps extensions for more complex behavior

-- open terminal in new tab helper
local open_terminal = function()
  vim.cmd("tabnew")
  vim.cmd("terminal")
end

-- just open terminal in new tab
vim.keymap.set("n", "<leader>t", function()
  open_terminal()
end, { desc = "Open [T]erminal"})

-- just open terminal in new tab and execute C++ file
-- TODO: update to support multiple languages
vim.keymap.set("n", "<leader>x", function()
  local file = vim.fn.expand("%")

  if file == "" then
    print("No file to run")
    return
  end

  open_terminal()

  -- get language for specific run
  local cmd = string.format("g++ %s -o a.out && ./a.out\n", file)

  -- Send command to terminal
  vim.fn.chansend(vim.b.terminal_job_id, cmd)
end, { desc = "E[x]ecute current file"})

