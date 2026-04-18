require("setup/global")
require("setup/options")
require("setup/keymaps")
require("setup/autocmds")
require("lazy/setup")

-- TODO: find a better way to manage this.
-- for future add a theme switcher
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "cyberdream",
  callback = function()
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#ffffff", bold=true })
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#cccccc", bold = true })
  end,
})

vim.api.nvim_set_hl(0, "LineNr", { fg = "#cccccc" })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#cccccc", bold = true })
vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#cccccc" })
vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#cccccc" })

vim.cmd.colorscheme("cyberdream")
