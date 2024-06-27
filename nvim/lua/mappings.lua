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

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
-- map("n", "<leader>rcu", function()
--   require('crates').upgrade_all_crates()
-- end, { desc = "update crates" })
