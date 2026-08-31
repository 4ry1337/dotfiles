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
			"markdown-oxide",
			-- JS/TS
			"vtsls",
			-- formatters
			"prettierd",
			"clang-format",
			"taplo",
			-- misc
			"typos-lsp",
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
