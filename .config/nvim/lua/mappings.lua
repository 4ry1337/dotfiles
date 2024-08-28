require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map(
  "n",
  "<leader>db",
  "<cmd> DapToggleBreakpoint <cr>",
  { desc = "Add breakpoint at line" }
)

map(
  "n",
  "<leader>dr",
  "<cmd> DapContinue <cr>",
  { desc = "Start or continue the debugger" }
)

-- let j and k move up and down lines that have been wrapped
map("n", "j", "gj")
map("n", "k", "gk")
