-- utils/runner_dispatcher.lua
local M = {}

-- Map of filetypes to modules
local runners = {
  c = "utils.run_c",
  cpp = "utils.run_cpp",
  python = "utils.run_py",
  java = "utils.run_java",
  kotlin = "utils.run_kt",
}

function M.run()
  local ft = vim.bo.filetype
  local runner_module = runners[ft]

  if not runner_module then
    vim.notify("No runner configured for filetype: " .. ft, vim.log.levels.WARN)
    return
  end

  local ok, runner = pcall(require, runner_module)

  if not ok or not runner.run then
    vim.notify("Runner module error for filetype: " .. ft, vim.log.levels.ERROR)
    return
  end

  runner.run()
end

return M
