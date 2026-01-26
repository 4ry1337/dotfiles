return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local ts = require("nvim-treesitter")
			local langs = require("configs.treesitter").ensure_installed
			ts.install(langs)

			vim.api.nvim_create_autocmd("FileType", {
				callback = function(ev)
					pcall(vim.treesitter.start, ev.buf)
					vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end,
			})
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		opts = {
			opts = {
				enable_close = true,
				enable_rename = true,
				enable_close_on_slash = true,
			},
		},
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
