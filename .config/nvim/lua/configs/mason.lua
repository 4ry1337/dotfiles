return {
	tool_installer = {
		ensure_installed = {
			"stylua",
			"prettierd",
			"clangd",
			"clang-format",
			"lua-language-server",
			"rust-analyzer",
			"sql-formatter",
			"dockerfile-language-server",
			"docker-compose-language-service",
			"buf-language-server",
			"typescript-language-server",
			"codelldb",
			"jdtls",
		},
		run_on_start = true,
		debounce_hours = 5,
		integrations = {
			["mason-lspconfig"] = true,
			-- ["mason-null-ls"] = true,
			-- ["mason-nvim-dap"] = true,
		},
	},
	mason = {
		max_concurrent_installers = 10,
	},
}
