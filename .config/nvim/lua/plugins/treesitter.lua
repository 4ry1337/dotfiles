return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			"windwp/nvim-ts-autotag",
		},
		opts = require("configs.treesitter"),
		main = "nvim-treesitter",
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		opts = {
			max_lines = 4,
		},
	},
	{
		"terrastruct/d2-vim",
		ft = { "d2" },
		dependencies = {
			{
				"ravsii/tree-sitter-d2",
				dependencies = { "nvim-treesitter/nvim-treesitter" },
				build = "make nvim-install",
			},
		},
	},
}
