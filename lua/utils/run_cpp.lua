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
function M.run_current_cpp()
  local dir = vim.fn.expand('%:p:h')
  local file = vim.fn.expand('%:p')
  local filename = vim.fn.expand('%:t')

  -- Check for a custom run script
  local run_script = dir .. "/run.sh"
  if vim.fn.filereadable(run_script) == 1 then
    run_in_terminal(run_script, dir)
    return
  end

  -- Fallback: compile and run the current C++ file
  local output = dir .. "/a.out"
  local compile_cmd = string.format("g++ -std=c++17 %s -o %s && %s", file, output, output)

  run_in_terminal(compile_cmd, dir)
end

return M

