--- @module 'mason-lspconfig'
return {
	--- @type lspconfig.Config
	clangd = {
		cmd = {
			"clangd",
			"--background-index",
			"--clang-tidy",
		},
		settings = {
			fallbackFlags = { "-std=c++20" },
		},
	},
	--- @type lspconfig.Config
	html = {},
	--- @type lspconfig.Config
	cssls = {},
	--- @type lspconfig.Config
	sqlls = {},
	--- @type lspconfig.Config
	dockerls = {},
	--- @type lspconfig.Config
	tailwindcss = {},
	--- @type lspconfig.Config
	gopls = {
		settings = {
			gopls = {
				completeUnimported = true,
				usePlaceholders = true,
				analysis = {
					unusedparams = true,
				},
			},
		},
	},
	--- @type lspconfig.Config
	vtsls = {
		settings = {
			vtsls = {
				autoUseWorkspaceTsdk = true,
				experimental = {
					completion = {
						enableServerSideFuzzyMatch = true,
						enableProjectDiagnostics = true,
					},
				},
			},
			typescript = {
				format = {
					semicolons = "remove",
					insertSpaceBeforeFunctionParenthesis = false,
					placeOpenBraceOnNewLineForFunctions = false,
					insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces = true,
					insertSpaceAfterOpeningAndBeforeClosingNonemptyBrackets = true,
					insertSpaceAfterOpeningAndBeforeClosingNonemptyParenthesis = true,
					trimTrailingWhitespace = true,
					convertTabsToSpaces = true,
					tabSize = 2,
					indentSize = 2,
				},
				preferences = {
					importModuleSpecifier = "shortest",
					quoteStyle = "single",
					includePackageJsonAutoImports = "on",
					organizeImports = true,
					renameMatchingJsxTags = true,
					useAliasesForRenames = true,
				},
				suggest = {
					completeFunctionCalls = false,
					includeAutomaticOptionalChainCompletions = true,
				},
			},
			javascript = {
				format = {
					semicolons = "remove",
					quoteStyle = "single",
					trimTrailingWhitespace = true,
					convertTabsToSpaces = true,
					tabSize = 2,
					indentSize = 2,
				},
				preferences = {
					importModuleSpecifier = "shortest",
					quoteStyle = "single",
					organizeImports = true,
				},
			},
		},
	},
	--- @type lspconfig.Config
	rust_analyzer = {
		settings = {
			["rust-analyzer"] = {
				check = {
					command = "clippy",
				},
				diagnostics = {
					enable = false,
				},
				rustfmt = {
					extraArgs = { "+nightly" },
				},
			},
		},
	},
}
