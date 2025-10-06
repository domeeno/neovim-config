local M = {}

local function run_in_terminal(cmd, dir)
  local term = require("toggleterm.terminal").Terminal
  local runner = term:new({
    cmd = cmd,
    hidden = true,
    direction = "float",
    close_on_exit = false,
    dir = dir
  })
  runner:toggle()
end

-- Compiles and runs the currently opened C++ file in a new terminal
function M.run()
  local dir = vim.fn.getcwd()

  -- Check for a custom run script
  local run_script = dir .. "/run.sh"

  if vim.fn.filereadable(run_script) == 1 then
    vim.notify("running run script")
    run_in_terminal(run_script, dir)
    return
  end

  if vim.fn.filereadable(file) == 1 then
    local file = vim.fn.expand('%:p')
    vim.notify("running gcc on " .. file)
    local output = dir .. "/a.out"
    local compile_cmd = string.format("gcc %s -o %s && %s", file, output, output)
    run_in_terminal(compile_cmd, dir)
    return
  end
end

return M
