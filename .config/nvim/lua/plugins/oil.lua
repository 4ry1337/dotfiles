return {
	{
		"stevearc/oil.nvim",
		opts = require("configs.oil"),
		config = function(_, opts)
			local oil = require("oil")
			oil.setup(opts)
			if opts.open then
				oil.open(vim.fn.getcwd())
			end
		end,
	},
}
