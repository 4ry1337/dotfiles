return {
  { "nvchad/volt", lazy = true },
  { "nvchad/menu", lazy = true },
  { "tpope/vim-sleuth", lazy = true },
  {
    "cappyzawa/trim.nvim",
    lazy = true,
    opts = {
      ft_blocklist = { "markdown" },
    },
  },
  {
    "m4xshen/smartcolumn.nvim",
    lazy = true,
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    lazy = true,
  },
  { "ellisonleao/glow.nvim", config = true, cmd = "Glow" },
}
