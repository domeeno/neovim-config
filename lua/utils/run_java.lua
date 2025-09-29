local M = {}

function M.run()
  local file = vim.fn.expand("%")
  local class = vim.fn.expand("%:t:r")
  local cmd = string.format("javac %s && java %s", file, class)
  vim.cmd("split | terminal " .. cmd)
end

return M
