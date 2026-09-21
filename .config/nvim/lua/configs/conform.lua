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
		json = { "prettierd", "prettier" },
		javascript = { "prettierd", "prettier" },
		javascriptreact = { "prettierd", "prettier" },
		typescript = { "prettierd", "prettier" },
		typescriptreact = { "prettierd", "prettier" },
		nix = { "nixfmt" },
	}
}
