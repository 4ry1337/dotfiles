return {
	clangd = {
		cmd = {
			"clangd",
			"--background-index",
			"--clang-tidy",
			"-std=c++23",
			-- "--log=verbose",
		},
		init_options = {
			fallbackFlags = { "-std=c++23" },
		},
	},
	html = {},
	cssls = {},
	sqlls = {},
	dockerls = {},
	tailwindcss = {},
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
	eslint = {},
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
	rust_analyzer = {
		settings = {
			["rust-analyzer"] = {
				checkOnSave = {
					command = "clippy",
				},
				diagnostics = {
					enable = false,
				},
				{
					rustfmt = {
						extraArgs = { "+nightly" },
					},
				},
			},
		},
	},
}
