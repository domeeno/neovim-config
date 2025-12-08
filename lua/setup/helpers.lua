-- keymaps extensions for more complex behavior
-- open terminal in new tab helper
tab_terminal = function()
  vim.cmd("tabnew")
  vim.cmd("terminal")
end

vsplit_terminal = function()
  vim.cmd("vsplit")
  vim.cmd("terminal")
end

hsplit_terminal = function()
  vim.cmd("split")
  vim.cmd("terminal")
end

-- just open terminal in new tab and execute C++ file
-- TODO: update to support multiple languages
execute = function(environment)
  local file = vim.fn.expand("%")

  if file == "" then
    print("No file to run")
    return
  end

  environment()

  -- get language for specific run
  local cmd = string.format("g++ %s -o a.out && ./a.out\n", file)

  -- Send command to terminal
  vim.fn.chansend(vim.b.terminal_job_id, cmd)
end
