-- Set leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- General globals
vim.g.autoformat = true
vim.g.lazyvim_picker = "auto"
vim.g.ai_cmp = true
vim.g.deprecation_warnings = false
vim.g.trouble_lualine = true
vim.g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }
vim.g.root_lsp_ignore = { "copilot" }
vim.g.markdown_recommended_style = 0

-- Disable netrw (when using a modern file explorer)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local opt = vim.opt

-- File & backup handling
opt.undofile = true
opt.undolevels = 10000
opt.backup = false
opt.writebackup = false
opt.fileencoding = "utf-8"

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg"

-- UI
opt.number = true
opt.relativenumber = true
opt.numberwidth = 2
opt.cursorline = true
opt.signcolumn = "yes"
opt.showmode = false
opt.ruler = false
opt.linebreak = true
opt.breakindent = true
opt.scrolloff = 10
opt.sidescrolloff = 8
opt.laststatus = 3
opt.mouse = "a"
opt.termguicolors = true
-- opt.statuscolumn = [[%!v:lua.require'snacks.statuscolumn'.get()]]
opt.pumblend = 10
opt.pumheight = 10
opt.list = true
opt.timeoutlen = vim.g.vscode and 1000 or 300
opt.updatetime = 200
opt.cmdheight = 1

-- Tabs & Indentation
opt.expandtab = true
opt.shiftwidth = 2
opt.softtabstop = 2
opt.tabstop = 2
opt.shiftround = true
opt.smartindent = true

-- Completion
opt.completeopt = "menu,menuone,noselect"
opt.shortmess:append({ W = true, I = true, c = true, C = true })

-- Folding
opt.foldlevel = 99
if vim.fn.has("nvim-0.10") == 1 then
  opt.smoothscroll = true
  opt.foldexpr = "v:lua.require'lazyvim.util'.ui.foldexpr()"
  opt.foldmethod = "expr"
  opt.foldtext = ""
else
  opt.foldmethod = "indent"
  opt.foldtext = "v:lua.require'lazyvim.util'.ui.foldtext()"
end

opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}

-- Window management
opt.splitbelow = true
opt.splitright = true
opt.splitkeep = "screen"
opt.winminwidth = 5
opt.virtualedit = "block"

-- Clipboard
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"

-- Formatting
opt.autowrite = true
opt.formatoptions = "jcroqlnt"
opt.formatexpr = "v:lua.require'lazyvim.util'.format.formatexpr()"

-- Misc
opt.jumpoptions = "view"
opt.sessionoptions = {
  "buffers", "curdir", "tabpages", "winsize",
  "help", "globals", "skiprtp", "folds"
}
opt.confirm = true
opt.conceallevel = 2
opt.spelllang = { "en" }
opt.wrap = false

