return {
	tool_installer = {
		ensure_installed = {
			-- lua
			"stylua",
			"lua-language-server",
			-- C/C++
			"clangd",
			-- Rust
			"rust-analyzer",
			-- Markdown
			"marksman",
			-- Docker
			"dockerfile-language-server",
			"docker-compose-language-service",
			-- JS/TS
			"vtsls",
			-- css/tailwind
			"cssls",
			"tailwindcss",
			-- SQL
			"sqlls",
			"sql-formatter",
			-- formatters
			"prettierd",
			"clang-format",
			-- "codelldb",
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
