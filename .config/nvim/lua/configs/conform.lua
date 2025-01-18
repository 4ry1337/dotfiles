return {
	formatters_by_ft = {
		lua = { "stylua" },
		css = { "prettierd", "prettier" },
		md = { "prettierd", "prettier" },
		html = { "prettierd", "prettier" },
		rust = { "rustfmt", lsp_format = "fallback" },
		sql = { "sql_formatter" },
		c = { "clang-format" },
		cpp = { "clang-format" },
		toml = { "taplo" },
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_fallback = true,
	},
}
