return {
  "nvim-tree/nvim-tree.lua",
  opts = function()
    local nv = require "nvchad.configs.nvimtree"
    nv.git.ignore = false
    return nv
  end,
}
