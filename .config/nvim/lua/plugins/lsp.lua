return {
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { -- Automatically install LSPs and related tools to stdpath for Neovim
			-- Mason must be loaded before its dependents so we need to set it up here.
			-- Setup is called explicitly in config() below with configs.mason, not via opts here,
			-- since opts={} would call mason.setup({}) with defaults (PATH="prepend") first.
			{ "mason-org/mason.nvim" },
			"mason-org/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{ "j-hui/fidget.nvim", opts = {} },
			"saghen/blink.cmp",
			{
				"SmiteshP/nvim-navbuddy",
				dependencies = {
					"SmiteshP/nvim-navic",
					"MunifTanjim/nui.nvim",
				},
				opts = { lsp = { auto_attach = true } },
			},
		},
		config = function()
			-- LSP servers and clients are able to communicate to each other what features they support.
			--  By default, Neovim doesn't support everything that is in the LSP specification.
			--  When you add blink.cmp, luasnip, etc. Neovim now has *more* capabilities.
			--  So, we create new capabilities with blink.cmp, and then broadcast that to the servers.
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			local config = require("configs.mason")
			require("mason").setup(config.mason)
			require("mason-tool-installer").setup(config.tool_installer)
			local servers = require("configs.lsp")

			-- mason-lspconfig v2 ignores `handlers` and only auto-enables servers installed by mason,
			-- so servers provided via PATH (devenv, nix, system) must be enabled explicitly.
			vim.lsp.config("*", { capabilities = capabilities })
			for server_name, server in pairs(servers) do
				vim.lsp.config(server_name, server)
				vim.lsp.enable(server_name)
			end

			require("mason-lspconfig").setup({})
		end,
	},
}
