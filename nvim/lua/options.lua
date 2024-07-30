require "nvchad.options"

-- Numbers
vim.o.number = true
vim.o.relativenumber = true

-- Timings
vim.o.updatetime = 250
-- vim.o.timeout = true
vim.o.timeoutlen = 300
-- vim.o.ttimeoutlen = 10

-- Display
vim.o.conceallevel = 2

-- Clipboard
vim.o.clipboard = "unnamedplus"

-- Wrap
vim.o.textwidth = 60
vim.o.linebreak = true
vim.o.breakindent = true

-- Indenting
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.shiftwidth = 2 -- Number of spaces inserted when indenting
vim.o.smartindent = true
vim.o.tabstop = 2 -- A TAB character looks like 4 spaces
vim.o.softtabstop = 2 -- Number of spaces inserted instead of a TAB character

-- Save to undo file
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- Set terminal gui colors to true
vim.o.termguicolors = true
