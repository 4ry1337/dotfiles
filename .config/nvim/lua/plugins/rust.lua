return {
	{
		"saecki/crates.nvim",
		event = { "BufRead Cargo.toml" },
		ft = { "rust", "toml" },
		config = function(_, opts)
			require("crates").setup(opts)
			require("crates").show()
		end,
	},
	-- {
	-- 	"mrcjkb/rustaceanvim",
	-- 	ft = "rust",
	-- },
	{
		"rust-lang/rust.vim",
		ft = "rust",
	},
	{
		"vxpm/ferris.nvim",
		ft = "rust",
	},
}
