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
      return require "nvchad.configs.treesitter"
    end,
    -- config = function(_, opts)
    --   require("nvim-treesitter.configs").setup(opts)
    -- end,
  },
}
