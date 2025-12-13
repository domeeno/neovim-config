-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.wrap = false -- disable line wrap

vim.opt.expandtab = true -- spaces instead of tabs
vim.opt.tabstop = 2 -- tabbing is inserting 4 spaces instead of default (8)
vim.opt.shiftwidth = 2 -- shift nicely

vim.opt.inccommand = "split" -- add a split window on edit to live preview change (instead of the current editor)

vim.opt.ignorecase = false -- false to ingorecase on vim commands like (:echo, :TSUpdate etc.).

-- editing

vim.opt.virtualedit = "block" -- allow virtual edit for visual block mode (for CTRL+V to go further than line cells)


-- history

vim.opt.undofile = true -- preserve history after end session
vim.opt.backup = false -- don't keep a backup after overwriting a file

-- navigation

vim.opt.scrolloff = 12 -- keep text more centered when moving cursor
vim.opt.scroll = 16 -- nr of lines to scroll for CTRL+U and CTRL+D
vim.opt.numberwidth = 8 -- put some space left of line numbers - text little more centered, easier to see relativelnr

-- syntax, highlighting, spelling

vim.opt.termguicolors = true -- make use of modern terminal emulators (ex: kitty) which supports richer set of colors
vim.opt.hlsearch = false -- don't preserve all matches for the last used search pattern

-- multiple windows

vim.opt.splitbelow = true -- open windows below (for example typing :h<Enter> for help)
vim.opt.splitright = true -- open split window to the right (instead of default left)

-- clipboard

vim.opt.clipboard = "unnamedplus" -- tell nvim to sync clipboard with system keyboard

-- language specific

vim.opt.fileencoding = "utf-8"

