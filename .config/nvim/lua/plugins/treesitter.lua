return {
  {
    "nvim-treesitter/nvim-treesitter",
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    dependencies = {
      "apple/pkl-neovim",
      "windwp/nvim-ts-autotag",
    },
    opts = function()
      return require "configs.treesitter"
    end,
  },
}
