return {
  "kylechui/nvim-surround",
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup({
      keymaps = {
        normal = "<leader>sy",
        visual = "<leader>s",
        delete = "<leader>sd",
        change = "<leader>sc",
      }
    })
  end,
}
