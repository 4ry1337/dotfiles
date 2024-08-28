return {
  "nvim-tree/nvim-tree.lua",
  opts = function()
    local nv = require "nvchad.configs.nvimtree"
    nv.filters.git_ignored = false
    nv.filters.dotfiles = false
    return nv
  end,
}
