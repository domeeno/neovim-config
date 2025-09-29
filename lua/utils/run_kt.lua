-- utils/run_kotlin.lua
local M = {}

function M.run()
  local file = vim.fn.expand("%")
  local cmd = "kotlinc " .. file .. " -include-runtime -d output.jar && java -jar output.jar"
  vim.cmd("split | terminal " .. cmd)
end

return M
