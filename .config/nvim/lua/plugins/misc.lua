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
	{ "folke/zen-mode.nvim", opts = require("configs.zenmode") },
	{ "ellisonleao/glow.nvim", config = true, cmd = "Glow" },
	{
		"MeanderingProgrammer/render-markdown.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {},
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
	{ -- Add indentation guides even on blank lines
		"lukas-reineke/indent-blankline.nvim",
		-- Enable `lukas-reineke/indent-blankline.nvim`
		-- See `:help ibl`
		main = "ibl",
		opts = {},
	},
}
