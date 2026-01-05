-- keymaps extensions for more complex behavior
-- open terminal in new tab helper
Tab_terminal = function()
  vim.cmd("tabnew")
  vim.cmd("terminal")
end

Vsplit_terminal = function()
  vim.cmd("vsplit")
  vim.cmd("terminal")
end

Hsplit_terminal = function()
  vim.cmd("split")
  vim.cmd("terminal")
end

-- just open terminal in new tab and execute C++ file
-- TODO: update to support multiple languages
Execute = function(environment)
  local file = vim.fn.expand("%")

  if file == "" then
    print("No file to run")
    return
  end

  environment()

  local flags = "-std=c++23 -pedantic-errors -Wall -Weffc++ -Wextra -Wconversion -Wsign-conversion -Werror"

  -- get language for specific run
  local cmd = string.format(
    "g++ %s %s -o a.out && ./a.out\n",
    file, flags)

  -- Send command to terminal
  vim.fn.chansend(vim.b.terminal_job_id, cmd)
end

Open_in = function(environment)
  local dir = vim.fn.expand("%:p:h")
  if dir == "" then
    dir = vim.fn.getcwd()
  end

  environment()

  vim.cmd("lcd " .. dir)
  vim.cmd("terminal")
end
