return {
	formatters_by_ft = {
		lua = { "stylua" },
		css = { "prettierd", "prettier" },
		md = { "prettierd", "prettier" },
		html = { "prettierd", "prettier" },
		rust = { "rustfmt" },
		sql = { "sql_formatter" },
		c = { "clang-format" },
		cpp = { "clang-format" },
		toml = { "taplo" },
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_format = "fallback",
		lsp_fallback = true,
	},
	formatters = {
		rustfmt = {
			options = {
				default_edition = "2021",
			},
		},
		clang_format = {
			prepend_args = { "--style=LLVM" },
		},
	},
}
