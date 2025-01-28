local opt = vim.opt
local o = vim.o
local g = vim.g

g.have_nerd_font = true
g.mapleader = " "
g.maplocalleader = "\\"

-- vim.schedule(function()
-- 	opt.clipboard = "unnamedplus"
-- end)

opt.laststatus = 3
opt.mouse = "a"
opt.number = true
opt.relativenumber = true
opt.numberwidth = 2

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append("<>[]hl")

-- Wrap
-- opt.wrap = false
opt.textwidth = 80
opt.linebreak = true
opt.breakindent = true

-- Tab
opt.tabstop = 2 -- A TAB character looks like 4 spaces
opt.softtabstop = 2 -- Number of spaces inserted instead of a TAB character
opt.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character

-- Indenting
opt.smartindent = true
opt.shiftwidth = 2 -- Number of spaces inserted when indenting

opt.scrolloff = 8 -- Minimal number of screen lines to keep above and below the cursor.

-- Save to undo file
opt.undofile = true
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

opt.termguicolors = true -- Set terminal gui colors to true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
opt.ignorecase = true
opt.smartcase = true

opt.hlsearch = true -- Highlights the results of the previous search
opt.incsearch = true -- Incremental search

opt.signcolumn = "yes" -- Keep signcolumn on by default

opt.updatetime = 50 -- Decrease update time
opt.timeoutlen = 300 -- Decrease mapped sequence wait time

-- disable some default providers
g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

-- UndoTree
g.undotree_SetFocusWhenToggle = 1
g.undotree_WindowLayout = 3

-- add binaries installed by mason.nvim to path
local is_windows = vim.fn.has("win32") ~= 0
local sep = is_windows and "\\" or "/"
local delim = is_windows and ";" or ":"
vim.env.PATH = table.concat({ vim.fn.stdpath("data"), "mason", "bin" }, sep) .. delim .. vim.env.PATH
