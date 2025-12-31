local keys = require("lazy.core.handler.keys")
return {
	-- deprecated
	-- { "ellisonleao/glow.nvim", config = true, cmd = "Glow" }, @type LazySpec
	{
		"MeanderingProgrammer/render-markdown.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {
			enabled = false,
			preset = "obsidian",
			completions = {
				blink = { enabled = true },
				lsp = { enabled = true },
			},
			--[[ on = {
				attach = function(ctx)
					vim.keymap.set(
						"n",
						"<leader>tm",
						"<cmd>RenderMarkdown toggle<cr>",
						{ desc = "[T]oggle [M]arkdown", buffer = ctx.buf }
					)
				end,
			}, ]]
		},
		keys = {
			{ "<leader>tm", "<cmd>RenderMarkdown toggle<cr>", desc = "[T]oggle [M]arkdown", ft = "markdown" },
		},
	},
	--[[ {
		"3rd/image.nvim",
		-- build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
		opts = {
			backend = "ueberzug",
			processor = "magick_cli",
			integrations = {
				markdown = {
					resolve_image_path = function(document_path, image_path, fallback)
						-- document_path is the path to the file that contains the image
						-- image_path is the potentially relative path to the image. for
						-- markdown it's `![](this text)`

						-- you can call the fallback function to get the default behavior
						return fallback(document_path, image_path)
					end,
				},
			},
		},
	},
	{
		"HakonHarnes/img-clip.nvim",
		event = "VeryLazy",
		opts = {},
		-- keys = {
		-- 	{ "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image", ft = "markdown" },
		-- },
	}, ]]
}
