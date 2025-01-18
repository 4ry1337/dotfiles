return {
	{ "tpope/vim-sleuth", event = "VeryLazy" },
	{ "m4xshen/smartcolumn.nvim", event = "VeryLazy" },
	{ "HiPhish/rainbow-delimiters.nvim", event = "VeryLazy" },
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "VeryLazy",
		opts = require("configs.lualine"),
	},
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
	{ "lewis6991/gitsigns.nvim", opts = require("configs.gitsigns") },
	{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
	{ "mbbill/undotree" },
	{ "folke/trouble.nvim" },
	{ "folke/zen-mode.nvim", opts = require("configs.zenmode") },
}
