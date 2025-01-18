return {
	{
		"stevearc/conform.nvim",
		event = "BufWritePre", -- uncomment for format on save
		opts = require("configs.conform"),
		-- config = function(_, opts)
		--   require "conform".setup(opts)
		-- end
	},
}
